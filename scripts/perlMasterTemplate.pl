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

# Using comments

=pod
# Using some perl lib
use lib qw( /home/sdasgup3/Github/binary-decompilation/test/utils/ );
use utils;
=cut

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

# Hash / Map Usage
my %tool_path;
$tool_path{'llvm'} = "$home";
my $lenhash = scalar keys %tool_path;

# Concatenate Print
print "\n" . $lenhash . "\n";

# Keys of hash
my @fruits = keys %tool_path;
for my $fruit (@fruits) {
}

for my $fruit ( keys %tool_path ) {
}

# Array Usage
my @maindirs = ( "llvm", );
my @all      = ();
push( @all, @maindirs );
push( @all, "clang" );

# Using fileparse
my ( $bin, $dir, $ext ) = fileparse( "a/b/c.cpp", qr/\.[^.]*/ );
print "$dir$bin$ext" . "\n";

# create Dir
sub createDir {
    my $args = shift @_;
    make_path(
        $args,
        {
            chmod => 0777,
        }
    );
}

# Useful Subroutine

sub execute {
    my $args = shift @_;
    print "$args \n";
    system("$args");
}

sub info {
    my $args = shift @_;
    system("echo  \e[4m\e[1m\e[34m$args\e[0m");
}

sub passInfo {
    my $args = shift @_;
    system("echo  \e[4m\e[1m\e[92m$args\e[0m");
}

sub failInfo {
    my $args = shift @_;
    system("echo  \e[4m\e[1m\e[91m$args\e[0m");
}

sub warnInfo {
    my $args = shift @_;
    system("echo  \e[4m\e[1m\e[35m$args\e[0m");
}

# Passing ref to arrays
my @arr1 = ();
my @arr2 = ();
compareStates( \@arr1, \@arr2 );

sub compareStates {
    my ( $k_ref, $x_ref ) = @_;
    my @kstates = @{$k_ref};
    my @xstates = @{$x_ref};

    # return value
    return @xstates;
}

# Regex match
my @xpatterns = ( qr/\$\d* = (\d+)/, qr/\$\d* = \[ ([CPAZSOIF ]*) \]/, );
my $someline = "";
if ( $someline =~ m/$xpatterns[0]/ ) {
    print $1. "\n";
}

# Regex replace
# r is non destructive modifier
my $TMPL    = "aSUBSTc";
my $MODTMPL = $TMPL =~ s/SUBST/REPLACE/gr;

## Multiline strings without including the newlines and indents
my $name    = 'Foo';
my $message = <<"END_MSG";
Hello $name,

how are you?
END_MSG

# Lazy evaluation of variables
my $msg  = "?";
my $talk = "10 $msg 10 ";

$msg = "==";
print "$talk" . "\n";
print "But we want\n";
my $modtalk = $talk =~ s/\?/\=\=/gr;
print $modtalk;
