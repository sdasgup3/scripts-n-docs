#!/usr/bin/perl

# Common includes
use strict;
use warnings;
use Getopt::Long;
use File::Compare;
use File::chdir;
use Cwd;
use File::Path qw(make_path remove_tree);
use Env;

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


# Execute shell commands
system("touch $file");

# File Open
open( my $fp, "<", $file ) or die "cannot open: $!";
my @lines = <$fp>;
for my $line (@lines) {
    chomp $line;
}
system("rm $file");

# File exist
my $dir  = "";
if ( ( -e $file ) and ( -d $dir ) ) {
}

# Subroutine
sub execute {
    my $args = shift @_;
}

# Hash / Map Usage
my %tool_path;
$tool_path{'llvm'} = "$home";

# Array Usage
my @maindirs = ( "llvm", );
my @all      = ();
push( @all, @maindirs );
push( @all, "clang" );
