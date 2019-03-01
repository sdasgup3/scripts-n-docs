#!/usr/bin/perl

# Common includes
use strict;
use warnings;
use Getopt::Long;

my $file = "";

GetOptions(
    "file:s" => \$file,
) or die("Error in command line arguments\n");

open( my $fp, "<", $file ) or die "cannot open: $!";
my @lines = <$fp>;
close $fp;


my @LS = ();
for my $line (@lines) {
    chomp $line;

    if($line =~ m/Testcase (\d+)/) {
      my $num  = $1;

      if($num == 0) {
        @LS = ();
      } else {
        my $curr = $num -1;
        open( my $fp, ">", "test_$curr" ) or die "cannot open: $!";
        print $fp join("\n",@LS);
        @LS = ();
      }
    }

    push @LS, $line;
}
