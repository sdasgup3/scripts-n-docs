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

GetOptions(
    "file:s" => \$file,
) or die("Error in command line arguments\n");

# File Open
open( my $fp, "<", $file ) or die "cannot open: $file: $!";
my @lines = <$fp>;

my %map = ();

for my $line (@lines) {
    chomp $line;

    if(exists $map{$line}) {
      print $line."\n";
    } else {
      $map{$line} = 1;
    }
}

