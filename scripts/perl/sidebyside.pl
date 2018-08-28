#!/usr/bin/perl

# Common includes
use strict;
use warnings;
use Getopt::Long;
use File::Compare;
use File::Basename;

my $file = "";

GetOptions(
    "file:s" => \$file,
) or die("Error in command line arguments\n");

open( my $fp, "<", $file ) or die "cannot open: $!";
my @lines = <$fp>;
for my $line (@lines) {
    chomp $line;
    print "$line $line" . "\n"
}
