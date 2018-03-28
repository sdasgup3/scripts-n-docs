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
my @file = ();
my @show = ();

GetOptions(
    "file:s" => \@file,
    "show:s" => \@show,
) or die("Error in command line arguments\n");

# File Open
open( my $fp0, "<", $file[0] ) or die "cannot open: $file[0]: $!";
open( my $fp1, "<", $file[1] ) or die "cannot open: $file[1]: $!";
my @lines0 = <$fp0>;
my @lines1 = <$fp1>;

my %map0 = ();
my %map1 = ();

for my $line0 (@lines0) {
    chomp $line0;

    $map0{$line0} = 1;
}

for my $line1 (@lines1) {
    chomp $line1;

    $map1{$line1} = 1;
}

my $present0 = 0;
my $absent0 = 0;
my $present1 = 0;
my $absent1 = 0;
my $show0 = 0;
my $show1 = 0;
my $showPresent = 0;

if((1 == scalar(@show) and $show[0] == 0)  or (2 == scalar(@show) and $show[1] == 0)) {
  $show0 = 1;
}
if((1 == scalar(@show) and $show[0] == 1)  or (2 == scalar(@show) and $show[1] == 1)) {
  $show1 = 1;
}
if((1 == scalar(@show) and $show[0] == 2)) {
  $showPresent = 1;
}

for my $key0 (sort keys %map0) {
  if(exists $map1{$key0}) {
    $present0 ++;
    if(1 == $showPresent) {
      print $key0 . "\n";
    }
  } else {
    $absent0 ++;
    if(1 == $show0) {
      print $key0 . "\n";
    }
  }
} 

if(scalar(@show)) {
  print "=====================\n";
}

for my $key1 (sort keys %map1) {
  if(exists $map0{$key1}) {
    $present1 ++;
  } else {
    $absent1 ++;
    if(1 == $show1) {
      print $key1 . "\n";
    }
  }
}


if($present0 != $present1) {
  utils::failInfo("Error 00");
}

print "A: $file[0]: " . scalar(keys %map0) . "\n";
print "B: $file[1]: " . scalar(keys %map1) . "\n";
print "A - B: " . $absent0 . "\n";
print "B - A: " . $absent1 . "\n";
print "A & B: " . $present0 . "\n";







