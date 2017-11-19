#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
use File::Compare;

# Status
my $found = 0;
my $not_found = 0;
my $cfg_to_bc_error = 0;
my $total = 0;
my $file = "";
my $help;

my @nf = ();

GetOptions (
            "help"          => \$help, 
            "file:s"        => \$file,
            ) or die("Error in command line arguments\n");



if($help) {
  print ("run.pl   \n");
  exit(1);
}


open(my $fp, "<", $file) or die "cannot open: $!";
my @files = <$fp>;
for my $file (@files) {
  chomp $file;
  my $lifted = $file.".lifted";

  $total += 1;
  if(-e $lifted) {
    $found +=1 ;
  } else {
    $not_found +=1 ;
    push @nf, $file;
  }
}

print "Total: " . $total . "\n";
print "Found " . $found . "\n";
print "Not Found " . $not_found . "\n";

for my $file (@nf) {
  print $file . "\n";
}


# Utilities
sub execute {
  my $args = shift @_;
  print "$args \n";
  system("$args");
}
