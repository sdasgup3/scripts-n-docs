#!/usr/bin/perl

# Common includes
use strict;
use warnings;
use Getopt::Long;
use File::Compare;
use File::Basename;
use File::chdir;
use Cwd;
use File::Path qw(make_path remove_tree);
use Env;

use lib qw( /home/sdasgup3/scripts-n-docs/scripts/perl/ );
use utils;

# Using GetOPtions
my $file = "";
my $patt = "";
my $antipatt = "";
my $show = "";
my $count = "";
my @buffer = ();

GetOptions(
    "file:s" => \$file,
    "patt:s" => \$patt,
    "show" => \$show,
    "count" => \$count,
    "antipatt:s" => \$antipatt
) or die("Error in command line arguments\n");

open( my $fp, "<", $file) or die "cannot open: $file: $!";
my @lines = <$fp>;



my $include_file = 0;
if("" ne $antipatt) {
  $include_file = 1;
}


if("" eq $patt) {
  $patt = "chasus";
}
if("" eq $antipatt) {
  $antipatt = "chasus";
}

#print "Pattern:$patt\n";
#print "AntiPattern:$antipatt\n";

my $lno = 0;
for my $line (@lines) {
    chomp $line;

    my $prevline = $line;

    if($line =~ m/$patt/g) {
      $include_file = 1;
      if("" ne $show) {
        push @buffer, $line;
      }

      $line = $prevline;
      if("" ne $count) {
        my @matches = $line =~ /$patt/g;
        print $line. ":". scalar(@matches). "\n";
      }

    }
    if($line =~ m/$antipatt/g) {
      $include_file = 0;
    }
}

print $file."\n" if 1 == $include_file;

if($include_file and $show) {
  printArray(\@buffer, "");
}


