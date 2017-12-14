package utils;

use File::Compare;
use File::Basename;
use strict;
use File::Path qw(make_path remove_tree);
use POSIX;

use bigint;
use bigint qw/hex oct/;

use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA     = qw(Exporter);
@EXPORT =
  qw(createDir execute info passInfo failInfo display toHex toDec printwithspaces dec2bin signExtend float2binary bin2hex split_filename);
@EXPORT_OK = qw();

sub createDir {
    my $args = shift @_;
    make_path(
        $args,
        {
            chmod => 0777,
        }
    );
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
    system("echo Failed:\e[4m\e[1m\e[91m$args\e[0m");
}

sub warnInfo {
    my $args = shift @_;
    system("echo Warn:  \e[4m\e[1m\e[35m$args\e[0m");
}

sub display {
    my $args = shift @_;
    print "\t$args \n";
}

# Sign extend a hex value.
sub signExtend {

    my $hex = shift @_;
    my $bit = shift @_;

    my @hexstr        = split( //, $hex );
    my $msb4bits      = $hexstr[0];
    my $n             = hex($msb4bits);
    my $ans           = "" . $hex;
    my $fourBitchunks = $bit / 4;
    my $tobefilled    = $fourBitchunks - scalar(@hexstr);
    my $filler        = "0";
    if ( $n >= 8 ) {
        $filler = "f";
    }

    for ( my $i = 0 ; $i < $tobefilled ; $i++ ) {
        $ans = $filler . $ans;
    }

    return $ans;
}

# convert hex to decimal
sub toDec {

    my $hex = shift @_;
    my $bit = shift @_;
    my $ans = "";

    my @hexstr = split( //, $hex );
    my $smin = pow( 2, $bit - 1 );

    my $msb4bits = $hexstr[0];
    my $n        = hex($msb4bits);
    if ( $n >= 8 ) {
        my @rest     = @hexstr[ 1 .. @hexstr - 1 ];
        my $restHex  = join( "", @rest );
        my $addend   = hex( ( $n - 8 ) . $restHex );
        my $signed   = $addend - $smin;
        my $unsigned = hex($hex);

        #print $addend."\n";
        return $addend - $smin, hex($hex);
    }
    else {
        return ( hex($hex), hex($hex) );
    }
}

# Convert a binary string to hex
# Assume length(bin) % 4 -== 0
sub bin2hex {
    my $bin = shift @_;

    #print( "Bin: " . printwithspaces( $bin, 8 ) . "\n" );
    my %hmap = (
        "0000" => "0",
        "0001" => "1",
        "0010" => "2",
        "0011" => "3",
        "0100" => "4",
        "0101" => "5",
        "0110" => "6",
        "0111" => "7",
        "1000" => "8",
        "1001" => "9",
        "1010" => "a",
        "1011" => "b",
        "1100" => "c",
        "1101" => "d",
        "1110" => "e",
        "1111" => "f",
    );

    my @arr  = split( //, $bin );
    my $len  = length($bin);
    my $temp = "";
    my $ans  = "";
    for ( my $i = 0 ; $i < $len ; $i++ ) {
        if ( $i != 0 and ( $i + 1 ) % 4 == 0 ) {
            $temp = $temp . $arr[$i];

            #print( "Temp: " . $temp . " i: " . $i . "\n" );
            $ans  = $ans . $hmap{$temp};
            $temp = "";
            next;
        }
        $temp = $temp . $arr[$i];
    }

    return $ans;
}

sub float2binary {
    my $num = shift @_;
    my $bit = shift @_;
    my $ans = "";

    my $sign = "0";

    my $offset       = 127;
    my $exponentSize = 8;
    my $mantisaSize  = 23;
    my $roundingReq  = "";
    if ( 64 == $bit ) {
        $offset       = 1023;
        $exponentSize = 11;
        $mantisaSize  = 52;
    }

    my $encoding     = "";
    my $hex          = "";
    my $E            = "";
    my $biasedoffset = "";
    my $significand  = "";

    # Handling special values.
    if ( $num eq "0.0" or $num eq "-0.0" ) {
        $sign = "0";
        if ( $num eq "-0.0" ) {
            $sign = "1";
        }
        $E            = 0;
        $biasedoffset = dec2bin( $E, $exponentSize );
        $significand  = dec2bin( 0, $mantisaSize );
        $encoding     = $sign . $biasedoffset . $significand;
        $hex          = sprintf( '%X', oct("0b$encoding") );
        return (
            $sign . " "
              . $biasedoffset . " "
              . $significand . " "
              . $roundingReq,
            $hex
        );
    }

    if ( $num eq "inf" or $num eq "-inf" ) {
        $sign = "0";
        if ( $num eq "-inf" ) {
            $sign = "1";
        }
        $E            = 255;
        $biasedoffset = dec2bin( $E, $exponentSize );
        $significand  = dec2bin( 0, $mantisaSize );
        $encoding     = $sign . $biasedoffset . $significand;
        $hex          = sprintf( '%X', oct("0b$encoding") );
        return (
            $sign . " "
              . $biasedoffset . " "
              . $significand . " "
              . $roundingReq,
            $hex
        );
    }

    if ( $num < 0 ) {
        $sign = "1";
        $num  = -1 * $num;
    }
    my @arr = split( /\./, $num );

    #print( "num: " . $num, " arr: " . @arr ."\n");
    my ( $integralpart, $fractionpart ) = ( 0, 0.0 );
    if ( $arr[0] ne "" ) {
        $integralpart = $arr[0];
    }
    if ( $arr[1] ne "" ) {
        $fractionpart = "0." . $arr[1];

    }

    print(
        "integralpart: " . $integralpart,
        " fractionpart: " . $fractionpart . "\n"
    );
    my $bin_integral = sprintf( "%b", $integralpart );
    my $bin_fraction = "";

    # Compute binary equivalent of fractional part.
    for ( my $i = 0 ; $i < $bit ; $i++ ) {

        #print("$fractionpart\n\n");

        my $temp = $fractionpart * 2;

        #print("$temp\n\n");

        if ( 0 == $temp ) {
            $bin_fraction = $bin_fraction . "0";
            last;
        }
        my $inttemp = int($temp);
        $bin_fraction = $bin_fraction . $inttemp;

        #print( "temp: " . $temp . " inttemp: ",
        #    $inttemp . "bin_fraction: " . $bin_fraction . "\n" );
        $fractionpart = $temp - $inttemp;
    }

    # Find the rightmot 1.
    my $bin = $bin_integral . "." . $bin_fraction;
    print( "De-Normalized: " . $bin . "\n" );

    @arr = split( //, $bin );

    my $foundOne = 0;
    my $locOne   = 0;
    my $locDot   = 0;

    for ( my $i = 0 ; $i < scalar(@arr) ; $i++ ) {
        if ( $foundOne == 0 and $arr[$i] == "1" ) {
            $foundOne = 1;
            $locOne   = $i;

            #$newbin   = "1.";
            next;
        }
        if ( $arr[$i] eq "." ) {
            $locDot = $i - 1;
            next;
        }
        if ( $arr[$i] ne "." and $foundOne == 1 ) {

            #$newbin      = $newbin . $arr[$i];
            $significand = $significand . $arr[$i];

        }
    }

    # Calculating exponent
    my $e = ( $locDot - $locOne );
    if ( $locOne > $locDot ) {
        $e = $e + 1;
    }
    $E = $offset + $e;

    # Calculating binary equivalent of $E
    $biasedoffset = dec2bin( $E, $exponentSize );

    # Compute significand binary shaped to to 32/64.
    #print(  $significand. " "
    #      . length($significand) . " "
    #      . $mantisaSize
    #      . "\n" );
    my $lenSig = length($significand);
    if ( $lenSig > $mantisaSize ) {
        $significand = substr( $significand, 0, $mantisaSize );
        $roundingReq = "(RR)";
    }
    else {
        for ( my $i = 0 ; $i < $mantisaSize - $lenSig ; $i++ ) {
            $significand = $significand . "0";
        }
    }

    print( "Normalized: " . "1." . $significand . " 2^(" . $e . ")" . "\n" );

    $encoding = $sign . $biasedoffset . $significand;
    $hex = sprintf( '%X', oct("0b$encoding") );

    return (
        $sign . "-"
          . $biasedoffset . "-"
          . printwithspaces( $significand, 8 ) . " "
          . $roundingReq,
        $hex
    );
}

# Convert a decimal number to `bit` width binary
sub dec2bin {
    my $num = shift @_;
    my $bit = shift @_;
    my $ans = "";

    for ( my $i = 0 ; $i < $bit ; $i++ ) {
        if ( $num & 1 ) {
            $ans = "1" . $ans;
        }
        else {
            $ans = "0" . $ans;
        }
        $num = $num >> 1;
    }
    return $ans;
}

# Convert a decimal number to `bit` width hex
sub toHex {
    my $num = shift @_;
    my $bit = shift @_;

    if ( $num !~ m/^[-]?\d+$/ ) {
        return "";
    }

    if ( 0 != $bit % 4 ) {
        return $num;
    }

    my @hmap = (
        "0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "a", "b", "c", "d", "e", "f"
    );
    my $chunks = $bit / 4;

    my $ans = "";
    for ( my $i = 0 ; $i < $chunks ; $i++ ) {
        my $n = $num & 15;
        $ans = $hmap[$n] . $ans;
        $num = $num >> 4;
    }
    return $ans;
}

sub printwithspaces {
    my $value = shift @_;
    my $space = shift @_;

=pod
    print(  "Value: "
          . $value
          . " Length: "
          . length($value)
          . " Space:"
          . $space
          . "\n" );

=cut

    my $ans = "";
    my $len = length($value);
    if ( $len % $space != 0 ) {
        my $rem = $len % $space;
        print( "Rem: " . $rem . "\n" );
        my $leadingStr = substr( $value, 0, $rem );
        $ans = $leadingStr . " ";
        $value = substr( $value, $rem, $len - $rem );
    }

=pod
    print(  "Value: "
          . $value
          . " Length: "
          . length($value)
          . " Ans:"
          . $ans
          . "\n" );
=cut

    my @arr = split( //, $value );
    for ( my $i = 0 ; $i < scalar(@arr) ; $i++ ) {
        if ( $i != 0 and ( $i % $space ) == 0 ) {
            $ans = $ans . " " . $arr[$i];
        }
        else {
            $ans = $ans . $arr[$i];
        }
    }
    return $ans;
}

sub split_filename {
    my $arg = shift @_;

    if ( "" eq $arg ) {
        return ( "", "" );
    }
    my @components = split( /\//, ${arg} );
    my $filename = $components[ @components - 1 ];

    @components = split( /\./, ${filename} );
    my @slice = @components[ 0 .. @components - 2 ];
    my $file  = join ".", @slice;
    my $ext   = $components[ @components - 1 ];

    # print( "\n" . $filename . "%%" . $file . "%%" . $ext . "\n" );
    return ( $file, $ext );
}

1;
