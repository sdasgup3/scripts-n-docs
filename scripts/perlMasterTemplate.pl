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

# Using some perl lib
use lib qw( /home/sdasgup3/Github/binary-decompilation/test/utils/ );
use utils;

# Get environment Variable
my $home = $ENV{'HOME'};

# Get current dir
my $current = getcwd();
$CWD = $current;

# Using GetOPtions
my $file = "";
my $help = "";
GetOptions(
    "help"   => \$help,
    "file:s" => \$file,
) or die("Error in command line arguments\n");

# Equality / Unequality
if ( "" eq $file ) {
    $file = "test.txt";
}

if ( "" ne $help ) {
    exit(0);
}

# execute shell commands
system("touch $file");

# File Open
open( my $fp, "<", $file ) or die "cannot open: $!";
my @lines = <$fp>;
for my $line (@lines) {
    chomp $line;
}
system("rm $file");

# File exist
my $sdir = "";
if ( ( -e $file ) and ( -d $sdir ) ) {
}

# Subroutine
sub execute {
    my $args = shift @_;
}

# Hash / Map Usage
my %tool_path;
$tool_path{'llvm'} = "$home";
my $lenhash = scalar keys %tool_path;;

# Concatenate Print
print "\n". $lenhash. "\n";

# Array Usage
my @maindirs = ( "llvm", );
my @all      = ();
push( @all, @maindirs );
push( @all, "clang" );

# Using fileparse
my ( $bin, $dir, $ext ) = fileparse( "a/b/c.cpp", qr/\.[^.]*/ );
print "$dir$bin$ext" . "\n";
