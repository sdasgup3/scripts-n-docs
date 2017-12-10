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
use POSIX; # to use power
use bigint; # to stop imprecesion
use bigint qw/hex oct/;

#changing default prefix
# so that  we can use script.pl -foo -5
#Getopt::Long::Configure('prefix=+');
# new usage is script.pl +foo -5

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
my @nums = ();

GetOptions(
    "help"   => \$help,
    "file:s" => \$file,
    "nums:s" => \@nums,
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
my @arr = ();
my $lenarrr = scalar(@arr);
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

sub split_filename {
    my $arg = shift @_;
    # split with // mean each character
    my @components = split( /\//, ${arg} );
    my $filename = $components[ @components - 1 ];

    @components = split( /\./, ${filename} );
    my @slice = @components[ 0 .. @components - 2 ];
    my $file  = join ".", @slice;
    my $ext   = $components[ @components - 1 ];

    # print( "\n" . $filename . "%%" . $file . "%%" . $ext . "\n" );
    return ( $file, $ext );
}


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

# Passing references to arrays
my $scalar = "";
my @arr = ();
my %hash = ();
compareStates( \$scalar, \@arr, \%hash );

sub compareStates {
    my ( $a_ref, $b_ref, $c_ref ) = @_;
    my $A = ${$a_ref};
    my @B = @{$b_ref};
    my %C = %{$c_ref};


    # return value
    return @B;
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

# substring
my $masterstr = "I have horse";
print("\n". substr($masterstr, 7, 5));
