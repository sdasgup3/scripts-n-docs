#!/usr/bin/perl

# Common includes
use strict;
use warnings;
use Getopt::Long;
use File::Compare;
use File::Basename;

#use File::chdir;
use Cwd;
use File::Path qw(make_path remove_tree);
use Env;
Getopt::Long::Configure('prefix=+');
my $home = "";

BEGIN {
    my $script_dir = dirname(__FILE__);
    unshift @INC, $script_dir;
}


use utils;

# Get environment Variable
my $hexPattern   = qr/0x([0-9A-Za-z]+)/;
my $binPattern   = qr/0b([01]+)/;
my $floatPattern = qr/(\d*\.\d+)|(inf)|(-inf)/;

# Using GetOPtions
my $bit     = 64;
my $help    = "";
my $num     = "";
my $compare = "";

GetOptions(
    "bit:s"   => \$bit,
    "num:s"   => \$num,
    "compare" => \$compare,
    "help"    => \$help,
) or die(" Error in command line arguments \n ");

if ( "" ne $help ) {
    exit(0);
}

my ( $hexnum, $decimalnum, $binarynum, $unsigneddecimalnum );

if ( $num =~ m/$floatPattern/ ) {
    print("Input: $num Bitwidth: $bit\n");
    my ( $bin, $hex ) = float2binary( $num, $bit );

    print("Binary: $bin\n");
    print( "Hex: " . printwithspaces( $hex, 2 ) . "\n" );
    exit(0);
}

if ( $num =~ m/$hexPattern/ ) {
    $hexnum = $1;
    $hexnum = signExtend( $hexnum, $bit );
    ( $decimalnum, $unsigneddecimalnum ) = toDec( $hexnum, $bit );
}
elsif ( $num =~ m/$binPattern/ ) {
    my $bin = $1;
    $hexnum = bin2hex($bin);
    $hexnum = signExtend( $hexnum, $bit );
    ( $decimalnum, $unsigneddecimalnum ) = toDec( $hexnum, $bit );
}
else {
    $decimalnum = $num;
    $hexnum = toHex( $decimalnum, $bit );
    ( $decimalnum, $unsigneddecimalnum ) = toDec( $hexnum, $bit );
}

$binarynum = dec2bin( $decimalnum, $bit );

print("Input: $num Bitwidth: $bit\n");
print("\tDecimal:\n");
print("\t\tSigned:  $decimalnum\n");
print("\t\tUnsigned: $unsigneddecimalnum\n");
print( "\tHex: " . printwithspaces( $hexnum, 2 ), "\n" );
print( "\t\t2's Compliment binary: ", printwithspaces( $binarynum, 8 ) . "\n" );
