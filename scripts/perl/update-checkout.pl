#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long;
use File::chdir;
use Cwd;
use File::Path qw(make_path remove_tree);
use Env;

my $home="";
my $push="";
my $pull="";
my $rebase="";
my $llvm="";
my $clang="";
my $swift="";
my $show="";
my $current=getcwd();
my $help="";
my %tool_branch;
my %tool_path;
my $github="";
my $checkout="";
my $build="";
my $release="";
my $debug="";

## LLVM Projects
my @maindirs= ( 
  "llvm",	
  "compiler-rt",
  "test-suite",
  "clang",
#  "lldb",
);

foreach my $tool  (@maindirs) {
  $tool_branch{"$tool"} = 'master';
}

$tool_path{'llvm'} = "$current";
$tool_path{'compiler-rt'} = "$current/projects/compiler-rt" ;
$tool_path{'test-suite'} = "$current/projects/test-suite" ;
$tool_path{'clang'} = "$current/tools/clang";
$tool_path{'lldb'} = "$current/tools/lldb";

## Local Projects
$tool_path{'self-webifying'} = "$current";
$tool_path{'coding-puzzles'} = "$current";
$tool_path{'binary-decompilation'} = "$current";
$tool_path{'scripts-n-docs'} = "$current";
$tool_path{'compilers'} = "$current";
$tool_path{'parallel-programming'} = "$current";
$tool_path{'partial-redundancy-elimination'} = "$current";
$tool_path{'gri'} = "$current";

my @my_github_repos= ( 
  "self-webifying",	
  "coding-puzzles",
  "binary-decompilation",
  "scripts-n-docs",
  "compilers",
  "parallel-programming",
  "partial-redundancy-elimination",
  "gri",
);

my @all= ();

GetOptions (
            "help"          => \$help, 
            "checkout"      => \$checkout, 
            "push"          => \$push, 
            "pull"          => \$pull, 
            "build"         => \$build, 
            "rebase"        => \$rebase, 
            "show"          => \$show, 
            "github"        => \$github,
            "release"       => \$release,
            "debug"         => \$debug,
            ) or die("Error in command line arguments\n");

if($help) {
  helper();
  exit(1);
}

sub helper {
  print ("-.pl -checkout/-show/-merge/-pull/-push  \n");
}

if("" ne $github) {
  push(@all, @my_github_repos);
} else {
  push(@all, @maindirs);
}


if("" ne $show) {
  sub_show();
}

if("" ne $push) {
  sub_push();
}

if("" ne $pull) {
  sub_pull();
}

if("" ne $rebase) {
  sub_rebase();
}

if("" ne $checkout) {
  sub_checkout();
}

if("" ne ${build}) {
  sub_buildllvm();
}

sub sub_debug {
  my $builddir = "build/Debug";

  if(-e ${builddir}) {
    $CWD = $builddir;
    execute("make ENABLE_OPTIMIZED=0 DISABLE_ASSERTIONS=0 -j 8");
    execute("make install");
    $CWD = "$current";
  } else {
    mkdir "build";
    mkdir $builddir;
    $CWD = $builddir;

    execute("cmake -G \"Unix Makefiles\" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_INSTALL_UTILS=1 -DLLVM_ENABLE_ASSERTIONS=ON -DPYTHON_EXECUTABLE:FILEPATH=$ENV{HOME}/Install/Python-2.7.install/bin/python  -DPYTHON_LIBRARY:FILEPATH=$ENV{HOME}/Install/Python-2.7.install/lib/libpython2.7.so   -DPYTHON_LIBRARIES=${HOME}/Install/Python-2.7.install/lib/libpython2.7.so  -DCMAKE_BUILD_TYPE=\"Debug\" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm.debug.install -DLLVM_TARGETS_TO_BUILD=\"host\"  -DLLVM_TOOL_LLVM_LTO_BUILD=OFF LLVM_TOOL_LLVM_LTO2_BUILD=OFF ../..");
    execute("make ENABLE_OPTIMIZED=0 DISABLE_ASSERTIONS=0 -j 8");
    execute("make install");
    $CWD = "$current";
  }
}

sub sub_release {
  my $builddir = "build/Release";
  if(-e ${builddir}) {
    $CWD = $builddir;
    execute("make -j 32 ENABLE_OPTIMIZED=1 DISABLE_ASSERTIONS=0");
    execute("make -j 32 install");
    $CWD = "$current";
  } else {
    mkdir "build";
    mkdir $builddir;
    $CWD = $builddir;

    execute("cmake -G \"Unix Makefiles\" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_INSTALL_UTILS=1 -DLLVM_ENABLE_ASSERTIONS=ON -DPYTHON_EXECUTABLE:FILEPATH=$ENV{HOME}/Install/Python-2.7.install/bin/python  -DPYTHON_LIBRARY:FILEPATH=${HOME}/Install/Python-2.7.install/lib/libpython2.7.so   -DPYTHON_LIBRARIES=${HOME}/Install/Python-2.7.install/lib/libpython2.7.so  -DCMAKE_BUILD_TYPE=\"Release\" -DCMAKE_INSTALL_PREFIX=$ENV{HOME}/Install/llvm.debug.install -DLLVM_TARGETS_TO_BUILD=\"host\"  ../..");
    execute("make ENABLE_OPTIMIZED=0 DISABLE_ASSERTIONS=0 -j 32");
    execute("make -j 32 install");
    $CWD = "$current";
  }
}

sub sub_buildllvm {
  if("" ne $release) {
    sub_release();
  } elsif ("" ne $debug) {
    sub_debug();
  } else {
    sub_release();
    sub_debug();
  }
}

sub sub_show {
  foreach my $tool  (@all) {
    $CWD = "$tool_path{$tool}";
    print ("\n\nTool:  $tool \n");
    print ("\tRemotes \n");
    execute("git remote -v");
    print ("\tBranches \n");
    execute("git  branch -a");
    $CWD = "$current";
  }
}

sub sub_pull {
  foreach my $tool  (@all) {
    $CWD = "$tool_path{$tool}";
    print ("\n\nchdir: $CWD \n");
    print ("Pulling Tool from remote github:  $tool \n");
    execute("git pull origin $tool_branch{$tool}");
    $CWD = "$current";
  }
}

sub sub_push {
  foreach my $tool  (@all) {
    $CWD = "$tool";
    print ("\n\nPushing Tool to remote stash:  $tool \n");
    execute("git push stash $tool_branch{$tool}");
    $CWD = "$current";
  }
}

sub sub_checkout {
  foreach my $dir  (@all) {
    print ("\n\nCheckout $dir \n");
    execute("git clone git\@github.com:sdasgup3/${dir}.git");
  }
}

sub sub_rebase {

}



sub execute {
  my $args = shift @_;
  print "EXECUTING: $args \n";
  system("$args");
}

