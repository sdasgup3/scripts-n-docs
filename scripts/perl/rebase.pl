#!/usr/bin/perl

# Common includes
use strict;
use warnings;
use Getopt::Long;

# Using some perl lib
use lib qw( /home/sdasgup3/scripts-n-docs/scripts/perl/ );
use utils;


# Using GetOPtions
my $upstream_branch = "";
my $local_branch = "";

my $debug = 2;

GetOptions(
    "upstream_branch:s" => \$upstream_branch,
    "local_branch:s" => \$local_branch,
) or die("Error in command line arguments\n");

execute("git checkout $upstream_branch", $debug);
execute("git pull upstream $upstream_branch", $debug);
execute("git push origin $upstream_branch", $debug);
execute("git checkout $local_branch", $debug);
execute("git rebase $upstream_branch", $debug);
execute("git push origin $local_branch -f", $debug);
