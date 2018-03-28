# Installations

## Stoke/Strata
```
git clone git@gitlab.engr.illinois.edu:llvm/allvm-nixpkgs
cd allvm-nixpkgs/allvm/
nix-build -A projects.stoke
//change pkgs/projects/stoke/default.nix
nix-build -A projects.stoke
nix-env -f ~/Github/allvm-nixpkgs/allvm/defautl.nix -iA projects.stoke

nix-env -iA allvm.projects.strata-debug-haswell

cd strata/stoke
make debug
```

## ItelliJ (K framework setup)
```
  export K_OPTS="-Xmx4g"

tar -xvf ~/Downloads/ideaIC-2017.2.5.tar.gz
cd idea-IC-172.4343.14/
./bin/idea.sh

Application Cnfig VM options:
-Xms64m
-Xmx1024m
-Xss32m
-XX:+TieredCompilation
-Djava.awt.headless=true
-Djava.library.path="LD_LIBRARY_PATH:/home/sdasgup3/Github/k/k-distribution/target/release/k/lib/native/linux64/"
-ea

Program Arguments:
-krun -v --debug  /home/sdasgup3/Github/learning-K/test.test15


Env paths:
PATH:  /home/sdasgup3/Github/k/k-distribution/target/release/k/lib/native/linux:/home/sdasgup3/Github/k/k-distribution/target/release/k/lib/native/linux64:/home/sdasgup3/ida-6.95/:/home/sdasgup3/Github/k/k-distribution/target/release/k//bin/:/home/sdasgup3/Install/oprofile.install//bin/:/home/sdasgup3/.local//bin:/home/sdasgup3/Install/llvm.release.install/bin:/home/sdasgup3/.nix-profile/bin:/home/sdasgup3/.nix-profile/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

LD_LIBRARY_PATH
/home/sdasgup3/Github/k/k-distribution/target/release/k//lib/native/linux64/:/home/sdasgup3/Github/k/k-distribution/target/release/k//lib:/home/sdasgup3/Install/oprofile.install//lib/:/home/sdasgup3/.local//lib:/home/sdasgup3/Install/llvm.release.install/lib:/usr/local/lib/

mvn package -DskipTests

mvn -e clean verify
mvn package
```
### Paths
```
./java-backend/src/main/java/org/kframework/backend/java/symbolic/SymbolicRewriter.java:85
/home/sdasgup3/Github/k/shell/src/main/java/org/kframework/main/Main.java:235
```

## IDA
```
sudo apt-get install libgtk2.0-0:i386 libsm6:i386

```

## cvc4
  ```
  ./autogen.sh
  ./contrib/get-antlr-3.4
  ./configure --prefix=/home/sdasgup3/Install/cvc4.install --with-antlr-dir=/home/sdasgup3/Github/CVC4/antlr-3.4 ANTLR=/home/sdasgup3/Github/CVC4/antlr-3.4/bin/antlr3
  make ; make install
  ```
## sbt
  ```
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
  sudo apt-get update
  sudo apt-get install sbt
  ```

## switch apt-alternatives
  ```
  sudo update-alternatives --config gcc
  ```

## Oprofile [link](http://oprofile.sourceforge.net/doc/getting-started-with-ocount.html)
  ```
    nix-env -iA nixpkgs.automake
    sudo  apt-get install libpopt-dev
    sudo apt-get install libiberty-dev
  ```

## mono
  - boogie
  - Source [link](http://www.mono-project.com/docs/compiling-mono/linux/)
      ```
      PATH=$PREFIX/bin:$PATH
      git clone https://github.com/mono/mono.git
      cd mono
      ./autogen.sh --prefix=$PREFIX
      make
      make install
      ```
  - Ubuntu [link](http://www.mono-project.com/download/)

    ```
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/mono-official.list
    sudo apt-get update
    sudo apt-get install mono-devel

    ```

## tensorflow
  ```
    https://www.tensorflow.org/install/install_sources#ConfigureInstallation
  ```

## perf
  ```
  /proc/sys/kernel/perf_event_paranoid : 3 default
  find . -name "prof.data.*" | xargs rm -rf

  ```

## Gperftools
  ```
   ../configure --enable-frame-pointers --prefix=/home/sdasgup3/Install/gperftools.install
  ```
## z3
  ```
  git clone git@github.com:Z3Prover/z3.git
  cd z3
  python scripts/mk_make.py --prefix=~/Install/z3.install
  OR
  python scripts/mk_make.py --python
  // This will install python bindngs
  // as python binding  should reside under z3 prefix // dir

  cd build
  make -j 8
  make install
  ```

## lit
  ```
  % svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
  % cd llvm/utils/lit
  % sudo python setup.py install # Or without sudo, install in virtual-env.
  OR
  % sudo python setup.py install --user
  running install
  running bdist_egg
  running egg_info
  writing lit.egg-info/PKG-INFO
  ...
  % lit --version
  lit 0.5.0dev

  ```

## klee

  ```
  sudo apt-get install libncurses5-dev libncursesw5-dev

  INSTALL LLVM:
  cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm-3.4.release.install -DLLVM_TARGETS_TO_BUILD="host"   -DLLVM_INSTALL_UTILS=ON  -DLLVM_ENABLE_RTTI=OFF   ../../

  INSTALL KLEE:
  cmake ./../klee -DENABLE_SOLVER_STP=ON -DENABLE_KLEE_UCLIBC=ON -DKLEE_UCLIBC_PATH=/home/sdasgup3/Install/klee-uclibc/ -DENABLE_UNIT_TESTS=OFF -DCMAKE_BUILD_TYPE=Release -DENABLE_SYSTEM_TESTS=OFF -DENABLE_DOXYGEN=OFF -DKLEE_RUNTIME_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=OFF -DCMAKE_CXX_FLAGS="-fno-rtti"
  make

  RUN:
  clang klee_test_1.c -c -emit-llvm  -g -I ~/Install/klee.install/include/
  klee klee_test_1.bc
  klee-stats --print-all klee-last
  ```

## golang install

  ```
  Get the source
  https://golang.org/doc/install/source

  go > 1.4 are written in go itself
  Use go version manager
  https://github.com/moovweb/gvm
  to install the 1.4 first

  gvm install go1.4 -B
  gvm use go1.4
  export GOROOT_BOOTSTRAP=$GOROOT
  git clone https://go.googlesource.com/go
  cd go
  git checkout go1.8.1
  OR git checkout master
  cd src
  ./all.bash

  OR

  gvm list //Show the installed ones
  gvm listall
  gvm install go1.5

  ```

## cmake
  ```
    sudo apt-get install g++
    cd cmake
    ./configure
    make

    Latest Release (3.6.1)
    ./bootstrap --prefix=~/Install/cmake/
    make install
  ```

## nasm
  ```
  http://www.nasm.us/
   ./configure  --prefix=/home/sdasgup3/Install/nasm.install
   make
   make install
  ```

## LLVM
### llvm-3.5.0

  ```
  cd llvm
  mkdir build; cd  build
  cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm-3.5.0.release.install -DLLVM_TARGETS_TO_BUILD="all/host"  ..
  make ENABLE_OPTIMIZED=1 DISABLE_ASSERTIONS=0 -j 8
  make install
  ```

### llvm (configure)
  ```
  ../../configure --enable-optimized --disable-assertions --prefix
  ```

### build

  ```
  cd llvm
  mkdir build; cd  build
  cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON -DPYTHON_EXECUTABLE:FILEPATH=/home/sdasgup3/Install/Python-2.7.install/bin/python  -DPYTHON_LIBRARY:FILEPATH=/home/sdasgup3/Install/Python-2.7.install/lib/libpython2.7.so   -DPYTHON_LIBRARIES=/home/sdasgup3/Install/Python-2.7.install/lib/libpython2.7.so  -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm-3.5.0.debug.install -DLLVM_INSTALL_UITLS=1 -DLLVM_TARGETS_TO_BUILD="host"  ../..
  cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON   -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm.debug.install -DLLVM_INSTALL_UITLS=1 -DLLVM_TARGETS_TO_BUILD="host"  ../..
  cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON   -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm.release.install -DLLVM_INSTALL_UITLS=1 -DLLVM_TARGETS_TO_BUILD="host"  ../..
  make ENABLE_OPTIMIZED=1 DISABLE_ASSERTIONS=0 -j 8
  make install
  ```
### formatting
  ```
  make check-format
  make update-format
  ```

## scp

  ```
  scp ~/Downloads/cmake-3.6.1.tar.gz sdasgup3@presto:~/
  ```


## mcsema
  ```
  module load gcc/4.8.2
  module load glibc
  git clone git@github.com:trailofbits/mcsema.git
  cd mcsema
  sudo apt-get install git gcc-multilib g++-multilib build-essential cmake libc6-i386 nasm
  mkdir build
  cd build
  cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++  -DCMAKE_BUILD_TYPE=Release ..
  make


  rm -rf /home/sdasgup3/Github/mcsema_master/mc-sema/validator/x86_64/valTool/val.so
  rm -rf /home/sdasgup3/Github/mcsema_master/mc-sema/validator/x86_64/valTool/val.o
  cd /home/sdasgup3/Github/mcsema_master/mc-sema/validator/x86_64/valTool
  /usr/bin/g++ -std=gnu++0x   -m64 -DTARGET_IA32E -DHOST_IA32E -DTARGET_LINUX -fPIC -I/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/source/include/pin -I/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/source/include/pin/gen -I/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/extras/components/include -I/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/extras/xed2-intel64/include  -c val.cpp -o val.o
  /usr/bin/g++  -o val.so val.o -shared -m64 -L/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/intel64/lib/ -L/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/intel64/lib-ext -L/home/sdasgup3/Github/mcsema_master/build/mc-sema/pin/extras/xed2-intel64/lib  -m64 -shared -Wl,--hash-style=sysv -Wl,-Bsymbolic -lpin -lxed -ldwarf -lelf -ldl
  cd -
  ```

## wllvm
    ```
    LLVM_COMPILER=clang CC=wllvm CXX=wllvm++ make

    ```
## allvm
  - build
    ```
    source ~/scripts-n-docs/scripts/allvm.sh
    ```

  - Docs
    ```
      https://gitlab-beta.engr.illinois.edu/llvm/allvm-nixpkgs/tree/master/allvm/docs
    ```

  - Standalone build
    ```
      // Build llvm
      cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON   -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm.release.install -DLLVM_INSTALL_UTILS=1 -DLLVM_TARGETS_TO_BUILD="host" -DZ3_LIBRARIES=/home/sdasgup3/Install/z3.install//lib/ -DZ3_INCLUDE_DIR=/home/sdasgup3/Install/z3.install/include/   ../..
      make -j$(nproc); make install

      // Build allvm
      mkdir allvm
      mkdir build ; cd  build
      cmake  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_BUILD_TYPE="Debug"  -DLLVM_DIR=~/Install/llvm.debug.install/lib/cmake/llvm/ ..
      make -j$(nproc)
    ```

## perl

      ```
      https://www.perl.org/get.html#unix_like
      CC=gcc CXX=g++ ./Configure -des -Dprefix=/home/sdasgup3/Install/perl.install
      make -j 16
      make install

      Install extra module
      perl -MCPAN -e shell
      cpan> install Bundle::CPAN
      cpan> reload cpan
      cpan> install DateTime::TimeZone

      ```

## lldb
### Prerequisite:
  1. yum install libedit-devel libxml2-devel ncurses-devel python-devel swig
  2. Note swig 3.o.10 , and python 2.7 is already installed as shown in bashrc
  3. Also note the the python need to be configure with -enable-shared
  ```
  git clone  git@github.com:llvm-mirror/lldb.git llvm/tools/lldb
  nkdir build ; mkdir build/Debug/ ; cd build/Debug;
  cmake -G "Unix Makefiles" -DPYTHON_EXECUTABLE:FILEPATH=/home/sdasgup3/Install/Python-2.7.install/bin/python   -DPYTHON_LIBRARIES=/home/sdasgup3/Install/Python-2.7.install/lib/libpython2.7.so -DPYTHON_LIBRARY:FILEPATH=/home/sdasgup3/Install/Python-2.7.install/lib/libpython2.7.so   -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=${HOME}/Install/llvm.install -DLLVM_TARGETS_TO_BUILD="host"  ../..
  make -j 8
  ```

## Python
### build
  ```
  CC=gcc CXX=g++ ./configure --prefix=${HOME}/Install/Python-3.5.2.install -enable-shared --enable-unicode=ucs4
  make
  make install
  ```

### Pip
    - Installing
    ```
    $ curl -O https://svn.apache.org/repos/asf/oodt/tools/oodtsite.publisher/trunk/distribute_setup.py
    $ <new_python_bin>/python distribute_setup.py
    $ <new_python_bin>/easy_install pip
    ```

    - Using
    ```
    https://github.com/pypa/pip/issues/3813
    ```

## libffi
  ```
  module load autoconf
  git@github.com:libffi/libffi.git
  cd libffi
  ./autogen.sh
  mkdir; cd build
  CC=gcc CXX=g++ ../configure --prefix=${HOME}/Install/libffi.install
  make -j 16
  make install
  export PKG_CONFIG_PATH=/home/sdasgup3/Install/libffi.install/lib/pkgconfig/

  ```


## Swig
  ```
  http://www.linuxfromscratch.org/blfs/view/svn/general/swig.html
  CC=gcc CXX=g++ ./configure --prefix=${HOME}/Install/Swig.install
  make -j 8
  make install

  ```

## Binary Decompilation
  ```
  mkdir build;  cd build
  #cmake .. -DLLVM_ROOT=/home/sdasgup3/Install/llvm-3.5.0.debug.install/  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Debug -DLLVM_ENABLE_ASSERTIONS=ON
  cmake .. -DLLVM_ROOT=${HOME}/Install/llvm.release.install/  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Debug -DLLVM_ENABLE_ASSERTIONS=ON
  cmake --build .
  ```
## Anders
  ```
  mkdir build;  cd build
  // Keep llvm on path
  cmake ..   -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Debug -DLLVM_ENABLE_ASSERTIONS=ON
  cmake --build .
  ```

## llvm-slicer
  ```
    cd llvm-slicer
    CC=gcc CXX=g++ ./configure --with-llvmsrc=/home/sdasgup3/Install/llvm-3.5.0.src/  --with-llvmobj=/home/sdasgup3/Install/llvm-3.5.0.src/build/Debug/
    CXXFLAGS+=-std=c++11 make ENABLE_OPTIMIZED=1
  ```

## Doxygen
  ```
  git clone https://github.com/doxygen/doxygen.git
  cd doxygen
  mkdir build
  cd build
  cmake -G "Unix Makefiles"  -DCMAKE_INSTALL_PREFIX=${HOME}/Install/doxygen.install ..
  make
  make install

  ```

## stp
  ```
  git clone https://github.com/niklasso/minisat.git
  cd minisat
  mkdir build && cd build
  cmake ..  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/Install/minisat
  make
  make install

  git clone https://github.com/stp/stp.git
  cd stp
  mkdir build && cd build
  //cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/Install/stp  -DBUILD_STATIC_BIN=ON -DBUILD_SHARED_LIBS=OFF ..
  cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/Install/stp  -DBUILD_STATIC_BIN=OFF -DBUILD_SHARED_LIBS=ON  -DMINISAT_LIBRARY=/home/sdasgup3/Install/minisat/lib/ -DMINISAT_INCLUDE_DIR=/home/sdasgup3/Install/minisat/include/ ..
  cd /home/sdasgup3/Github/stp/build/tools/stp_simple
  /software/gcc-5.3/bin/g++   -std=c++11  -fPIC -Wall -Wextra -pedantic -Wunused -Wsign-compare -Wtype-limits -Wuninitialized -Wno-deprecated -Wstrict-aliasing -Wpointer-arith -Wformat-nonliteral -Winit-self -Wunreachable-code -O3    CMakeFiles/stp_simple.dir/main_simple.cpp.o CMakeFiles/stp_simple.dir/__/stp/main_common.cpp.o CMakeFiles/stp_simple.dir/__/stp/STPProgramGlobals.cpp.o  -o ../../stp_simple -rdynamic ../../lib/libstp.so.2.1.2 -Wl,-rpath,/home/sdasgup3/Github/stp/build/lib ~/Install/minisat/lib/libminisat.a
  make -j$(nproc)
  make install
  ```


# Cheetsheet

## Utils to Install
  - ncdu

## Atom Usage
### Multiline selection
  - Highlight multiple lines however you like.
  - Use the Selection|Split Into Lines command (press Ctrl+Shift+P and type Split Selection Into Lines) to split the multiline selection into a selection for each line.
  - Press the right arrow by itself to reveal the cursor at the end of the selections.

### Toggle Uper/Lower
 - Convert to Upper Case	⌘-k-u
 - Convert to Lower Case	⌘-k-L

## Binary Analysis
```
// disasssemble the test section
objdump -d -Mintel bin

// disassemble all sections
objdump -D -Mintel bin

// All the relocation in various sections
objdump -dr Output/test_1.clang.o
objdump -R Output/test_1.clang.o //dynamic relocation entries
readelf -r Output/test_1.clang.o

objdump -dr Output/test_1.clang.o
readelf --sections Output/test_1.clang.o

// Print contents of each section
readelf --hex-dump=5 Output/test_1.clang.o
readelf --hex-dump=6 Output/test_1.clang.o

Note: A number 4 byte hex number  laid out in memory as
00009830 is interpreted as hex (30 98 00 00)

```

## Package Manager (apt)
autoremove is used to remove packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed as dependencies changed or the package(s) needing them were removed in the meantime.
```
sudo apt-get autoremove
```
To see all possible upgrades, run a upgrade in verbose mode and (to be safe) with simulation, press n to cancel:
```
apt-get -V -s upgrade
```

List all installed packages
```
sudo dpkg -l | more
```

Search available packages
```
apt-cache search "abc"
```

### Ubuntu support
ubuntu-support-status

### Ubuntu repo
```
sudo nano /etc/apt/sources.list
```

### apt update-alternatives
First erased the current update-alternatives setup for gcc and g++:

```
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
```
#### Install Packages

```
sudo apt-get install gcc-4.3 gcc-4.4 g++-4.3 g++-4.4
Install Alternatives
```
Symbolic links cc and c++ are installed by default. We will install symbol links for gcc and g++, then link cc and c++ to gcc and g++ respectively.

```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.3 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 20

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.3 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 20

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++
```

#### Configure Alternatives

The last step is configuring the default commands for gcc, g++. It's easy to switch between 4.3 and 4.4 interactively:

```
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
Or Use slaves
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-4.9 g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6
```

## xargs
  ```
  find . -name ".." -o -name ".." | xargs -I'abc' mv 'abc' ~/Junk
  ```
## cscope
  ```
  find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.cc" > cscope.files
  cscope -q -R -b -i cscope.files
  cscope -q -R  -i cscope.files

  // llvm files
  cscope lib/*/*.h lib/*/*/*.h lib/*/*/*/*.h lib/*/*.cpp lib/*/*/*.cpp lib/*/*/*/*.cpp include/llvm/*.h include/llvm/*/*.h

  ```
## Linker Debugging
    ```
    -Wl,-v
    ```
##  Using Alias Analysis
  ```
  opt -basicaa -aa-eval -print-alias-sets  pa3.ll -disable-output
  opt -basicaa -aa-eval -print-all-alias-modref-info  pa3.ll -disable-output -debug-pass=Structure/Arguments
  opt -memdep -print-memdeps -gvn -analyze test_2.ll
  clang -cc1  -O1  -no-struct-path-tbaa -disable-llvm-optzns  test_0.c   -emit-llvm  -o x.ll
  ```
## What is the meaning of fact that in 64 bit system the pointer size is 8 bytes
    In 64 bit system a sungle fect should give u 64 bits; for the the pointer size need to be 64
    so that load i64* will give u 64 bit data
## Creating and using shared libs
  ```
  rm -rf lib.o lib.so
  /Method 1
  gcc -c  -fpic foo.c
  gcc -shared -o libfoo.so foo.o
  gcc -L./ -o test main.c -lfoo
  ldd ./test
  LD_LIBRARY_PATH=./ ./test

  rm -rf lib.o lib.so
  echo
  //Method 2
  gcc -c  -fpic foo.c
  gcc -shared -o libfoo.so foo.o
  gcc -L./ -o test main.c -lfoo -Wl,-v,-rpath,./
  ldd ./test
  ./test

  rm -rf lib.o lib.so
  echo
  //Wrong Method
  gcc -shared  -c  -fpic  foo.c  -o libfoo.so
  gcc -L./ -o test main.c -lfoo
  ldd ./test
  ./test

  ```

## About rpath
```
The -Wl,xxx option for gcc passes a comma-separated list of tokens as a space-separated list of arguments to the linker. So

gcc -Wl,aaa,bbb,ccc
eventually becomes a linker call

ld aaa bbb ccc
In your case, you want to say "ld -rpath .", so you pass this to gcc as -Wl,-rpath,. Alternatively, you can specify repeat instances of -Wl:

gcc -Wl,aaa, -Wl,bbb -Wl,ccc
```

## gcc commands

### Search paths
```
echo | gcc/clang  -E -Wp,-v -
```

### Defined preprocessor macros
 `` echo | gcc -E -dM -`` gives the preprocessor macros defined by the gcc. ``__x86_64__`` is one of those. Which is set/reset while compiling using gcc's ``-m64 / -m32``
## llvm commands

### clang
#### Run an LLVM Pass With Clang
 - `clang -Xclang -load -Xclang mypass.so *.c`

 ### llvm-xray
```
clang++ -g   -fxray-instrument  main.cpp prime.cpp fibonacci.cpp
XRAY_OPTIONS="patch_premain=true" ./a.out
llvm-xray account xray-log.a.out.PQ2EUM -instr_map=./a.out
```
### llvm-objdump
```
llvm-objdump -d -j .text  ./a.out
```

### llvm-tblgen
```
cd llvm/lib/Target/X86
llvm-tblgen -print-records X86.td -I=../../../include/
```
### llvm-mc
```
echo '0x0f 0x1 0x9' | llvm-mc -disassemble
echo "mov %rsp,%rbp" | llvm-mc -show-inst
echo "mov rbp, rsp" | llvm-mc -x86-asm-syntax=intel     -show-inst
echo "xorq %rcx, %rcx" | llvm-mc -show-encoding
llc -show-mc-inst // shows the MCInst along with the assembly
```

```
-debug-pass=Structure -print-after-all -print-before-all
-debug-pass=Arguments -print-after-all -print-before-all
-help-hidden
llvm-as < /dev/null | opt -O3 -disable-output -debug-pass=Arguments

For example, -O0 enables -mrelax-all, -O1 enables -vectorize-loops and -vectorize-slp, and -Ofast enables -menable-no-infs, -menable-no-nans, -menable-unsafe-fp-math, -ffp-contract=fast and -ffast-math.
echo 'int;' | clang -xc - -o /dev/null -mllvm -print-all-options
clang -help
clang -cc1 -help
clang -cc1 -mllvm -help
clang -cc1 -mllvm -help-list-hidden
clang -cc1as -help
```
### llvm test-suite
#### cmake
  ```
  cd test-suite
  mkdir build ; cd !$
  cmake ../ -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++
  OR
  cmake ../ -DCMAKE_C_COMPILER=<your own script> -DCMAKE_CXX_COMPILER=<your won script> -DCMAKE_C_FLAGS_RELEASE="-O0 -DNDEBUG" -DCMAKE_CXX_FLAGS_RELEASE="-O0 -DNDEBUG"

  where your_own_script: clang --gcc-toolchain=/software/gcc-5.3/ "$@"

  make // Just builds the target
  lit -v -j 1 . -o results.json
  ```
#### Configure
  ```
   ../../../../projects/test-suite/configure  --with-llvmsrc=~/Install/llvm  --with-llvmobj=~/Install/llvm/build/ -enable-  optimized --enable-assertions
   CC=clang CXX=clang++ ~/Install/llvm/projects/test-suite/configure --with-llvmsrc=~/Install/llvm  --with- llvmobj=~/Install/llvm/build/Release/  -enable-optimized --disable-assertions --with-built-clang
  ```
####  spec2006
##### Step
    ```
    (CMake based)
    export LLVM_SRC=~/Install/llvm
    export LLVM_BLD=~/Install/llvm.release.install
    export SPEC_SRC=~/Github/speccpu2006
    export TESTSUITE_BUILD_DIR=/home/sdasgup3/Github/LLVMProfiling/test-suite-build/

    mkdir $LLVM_SRC/projects/test-suite/test-suite-externals
    ln -s $SPEC_SRC $LLVM_SRC/projects/test-suite/test-suite-externals/speccpu2006

    mkdir $TESTSUITE_BUILD_DIR
    cd $TESTSUITE_BUILD_DIR
    cmake $LLVM_SRC/projects/test-suite -DCMAKE_C_COMPILER=<your own script> -DCMAKE_CXX_COMPILER=<your won script>
    cd External/SPEC/CINT2006/
    make -j 8
    lit -v -j 8 . -o results.json

      OR
    (Config based)
    $LLVM_SRC=points to the root of LLVM source code tree.
    $LLVM_BLD=points to the root of LLVM build  tree.
    $SPEC_SRC=points to the root of SPEC 2006 source code tree.
    mkdir $LLVM_SRC/projects/test-suite-externals
    ln -s $SPEC_SRC $LLVM_SRC/projects/test-suite-externals/speccpu2006

    cd $LLVM_BLD/projects/test-suite/External/SPEC
    or
    cd $TESTSUITE-BUILD-DIR (in case u are building testsuite out of llvm build tree)
    CC=gcc CXX=g++ ${LLVM\_SRC}/projects/test-suite/configure --with-llvmsrc=<> --with-llvmobj=<>
    make
    CC=/home/sdasgup3/Install/configureBased/llvm-3.8.release.install/bin/clang CXX=/home/sdasgup3/Install/configureBased/llvm-3.8.release.install/bin/clang++ make TEST=input_unopt


    OR (Last Resort)

    cp -rf llvm-src/projects/test-suite/External/SPEC/CINT2006/*  llvm-src/projects/test-suite/External/SPEC/CINT2006/ ; to copy the dir structure
    cd llvm-src/projects/test-suite/External/SPEC/CINT2006
    ls |& tee log // will put all the 12 spec dir in log file ; do log and remove Makefile
    foreach file (`cat log`)
      cp -rf /home/sdasgup3/speccpu2006/benchspec/CPU2006/$file/* $file/
    end
    cd llvm-build/projects/test-suite/External/SPEC/CINT2006
    ```

##### Rule

    ```
      Rule: *.linked.rbc

      Makefile.spec2006
        include $(LEVEL)/External/SPEC/Makefile.spec
          include MultiSource/Makefile.multisrc

      In MultiSource/Makefile.multisrc:
        we have the rule for Output/%.linked.rbc, whose dep are  in-turn mentioned in the saem file as

        -$(CC) $(CPPFLAGS) $(CFLAGS) $(OPTFLAGS) $(X_TARGET_FLAGS) -c $< -o $@
        X_TARGET_FLAGS depends on  TEST_TARGET_FLAGS mentioned in
          LLVM_SRC/projects/test-suite/Makefile.rules as
        TEST_TARGET_FLAGS += -fomit-frame-pointer
        OPTFLAGS = -O3
    ```

    ```
      Rule: \*.native or \*.simple (to create the native exec)
        In file: MultiSource/Makefile.multisrc

      Rule: \*.out-nat or \*.out-simple (to run the native exec)
        In file: Makefile.programs
        In file: External/SPEC/Makefile.spec

      Running the executable is contolled in :
        In file: External/SPEC/Makefile.spec

      Which size of testcase need to be run:
        Defined in : External/SPEC/CINT2006/400.perlbench/Makefile
        Chaoices are in:  External/SPEC/Makefile.spec2006


    ```


## google protobuf
```
CC=gcc CXX=g++ ../configure --prefix=${HOME}/Install/protobuf.install
make ; make install

~/Install/protobuf.install/bin/protoc -I=/home/sdasgup3/ /home/sdasgup3/addressbook.proto --cpp_out=/home/sdasgup3/Junk/
add
syntax = "proto2";
at the very top of proto defintion file

```

## Invoking clang with a chosen gcc
```
 clang++ -std=c++11 Flip_Game.cpp --gcc-toolchain=/software/gcc-5.3/ -v
```

## objdump
```
objdump -CDSRTtx a.out | less
```

## Nix
### General
#### List nix packages
```
nix-env -q    // installed
nix-env -qa   // available
```
#### Install / Uninstall nix packages
```
Use the above package name
nix-env -i    // install
nix-env -e    // uninstall
```
#### Channel
```
nix-channel --list
nix-channel --add https://gravity.cs.illinois.edu/channel/allvm
nix-channel --update
```
   ```
   echo $NIX_PATH
   echo $SHELL
   echo $PATH|grep nix
   // All available nix packages
   nix-env -qaP [optional search string]
   nix-env -iA specify the attribute obtained from above

   nix-env -iA nixpkgs.texlive.combined.scheme-full
   nix-env -iA nixpkgs.lit
   nix-env -iA nixpkgs.z3
   nix-env -iA nixpkgs.gperf
   nix-env -e subversion
   nix-collect-garbage -d

   nix-end -q //show all the installed packages.


   nix-build '<nixpkgs>' -A python27Packages.protobuf
   ls -l result
   nix-build '<nixpkgs>' -A pkgsi686Linux.python27Packages.protobuf

   nix-shell --pure ./default.nix
   nix-shell --pure ~/Github/IDA/Ida_software --run ~/.nix-profile/bin/idaq64

   nix-shell -p binutils

   ```

### Allvm
  ```
    unset LD_LIBRARY_PATH
    curl https://nixos.org/nix/install | sh
    . ${HOME}/.nix-profile/etc/profile.d/nix.sh
    Follow https://gitlab-beta.engr.illinois.edu/llvm/allvm-nixpkgs/blob/master/allvm/docs/SSHSubstituter.md

    nix-build allvm-nixpkgs/allvm/ -A allvm-tools
    nix-shell ~/allvm-umbrella/allvm-nixpkgs/allvm/ -A allvm-tools

    // Building Individual Allexes
    nix-build  ~/allvm-umbrella/allvm-nixpkgs/allvm/  -A  allexePkgs.which
    /nix/store/iymxs56x4x39rh4a53nh9rkrw1vwyl66-which-2.21-wllvm-allexe/bin/which clang

    e.g. https://gitlab-beta.engr.illinois.edu/llvm/allvm-nixpkgs/issues/1

    Adding channel:
    https://gitlab.engr.illinois.edu/llvm/allvm-nixpkgs/blob/master/allvm/docs/Channel.md
    nix.conf: /etc/nix/nix.conf
  ```
## SSH
### About ssh-config
```
cp programming/scripting/DotConfigFiles/github.key_rsa* ~/.ssh/
cp scripts-n-docs/scripts/config ~/.ssh/config
```
### ssh port
```
ssh -L 27000:presto.cs.illinois.edu:27000  -L 38187:presto.cs.illinois.edu:38187  presto
```
### Graphical display
```
ssh -X
```

## binutils vs coreutils
```
info binutils
```

## module
```
module avail
module list
```

## install .deb file
[link](https://askubuntu.com/questions/40779/how-do-i-install-a-deb-file-via-the-command-line)
```
dpkg -i .deb
fix dependency problems using: sudo apt-get install -f
```

## IDA
  - licence
  ```
  cd  /home/sdasgup3/Github/IDA/License
  ./lmutil  lmstat -a
  sudo /etc/init.d/lmadmin start
  https://github.com/NixOS/nixpkgs/issues/17057#issuecomment-233353381
  ```
  - Installation
  ```
  sudo dpkg --add-architecture i386
  sudo apt-get update
  sudo apt-get install libc6-i686:i386 libexpat1:i386 libffi6:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386 libglib2.0-0:i386 libice6:i386 libpcre3:i386 libpng12-0:i386 libsm6:i386 libstdc++6:i386 libuuid1:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdmcp6:i386 libxext6:i386 libxrender1:i386 zlib1g:i386 libx11-xcb1:i386 libdbus-1-3:i386 libxi6:i386 libsm6:i386 libcurl3:i386
  ```

## irssi
```
/network list
/connect irc.oftc.net
/join #uiuc-llvm #allvm -auto

/help server
/server list
/network list
/server add -network <> -auto <server name>

```

## python debug
```
import pdb; pdb.set_trace()
```

## screen
```
screen -ls
screen -r <>
screen // create new
Cntrl-a d // detach
Cntrl-a :quit //kill the entered session
```

## tmux
```
Cheatsheet: https://gist.github.com/MohamedAlaa/2961058
tmux Plugin: https://github.com/tmux-plugins/tpm
tmux-resurrect
```

## LLVM_BUILTIN_DEBUGTRAP
```
  /// LLVM_BUILTIN_TRAP - On compilers which support it, expands to an expression
  /// which causes the program to exit abnormally.
  #if __has_builtin(__builtin_trap) || LLVM_GNUC_PREREQ(4, 3, 0)
  # define LLVM_BUILTIN_TRAP __builtin_trap()
  #elif defined(_MSC_VER)
  // The __debugbreak intrinsic is supported by MSVC, does not require forward
  // declarations involving platform-specific typedefs (unlike RaiseException),
  // results in a call to vectored exception handlers, and encodes to a short
  // instruction that still causes the trapping behavior we want.
  # define LLVM_BUILTIN_TRAP __debugbreak()
  #else
  # define LLVM_BUILTIN_TRAP *(volatile int*)0x11 = 0
  #endif

  /// LLVM_BUILTIN_DEBUGTRAP - On compilers which support it, expands to
  /// an expression which causes the program to break while running
  /// under a debugger.
  #if __has_builtin(__builtin_debugtrap)
  # define LLVM_BUILTIN_DEBUGTRAP __builtin_debugtrap()
  #elif defined(_MSC_VER)
  // The __debugbreak intrinsic is supported by MSVC and breaks while
  // running under the debugger, and also supports invoking a debugger
  // when the OS is configured appropriately.
  # define LLVM_BUILTIN_DEBUGTRAP __debugbreak()
  #else
  // Just continue execution when built with compilers that have no
  // support. This is a debugging aid and not intended to force the
  // program to abort if encountered.
  # define LLVM_BUILTIN_DEBUGTRAP
  #endif
```

## golang usage
```
go get github.com/google/codesearch/index
cd $GOPATH/src
go list ./...
go test ./...
go build -x/-help

```

## Important links
```
https://gitlab-beta.engr.illinois.edu/llvm/oci
```

## SBT
```
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

```

## Set terminal tab title
```
xtitle
```
## FlameGraph

  ```
  perf  record  -ag -F 100 ./a.out
  or
  perf record -F 99 -p 181 -g -- sleep 60

  sudo perf report -n --stdio

  perf script > out.perf
  ../stackcollapse-perf.pl out.perf > out.folded
  ../flamegraph.pl out.folded > expl.svg

  ```

## Unix commands
  ```
  find . -maxdepth 1 -name "test_*"

  // - is used for stdin
  echo 'hello' |cat - file.txt > hello_concated.txt
  ```

  ```
  https://www.tutorialspoint.com/unix/unix-signals-traps.htm
  trap "rm -f $WORKDIR/work1$$ $WORKDIR/dataout$$; exit" 1 2 // Remove the specified files when Ctrl-C is pressed (signal 1) or line hungup (2)
  ```

  ```
  apt list --installed
  apt-cache search keyword
  ```





-----------------------------------------------------------------------------------------------------------------------------------------------------

Dont know
===========
```
sys::PrintStackTraceOnErrorSignal(argv[0]);
  PrettyStackTraceProgram X(argc, argv);
  llvm_shutdown_obj Y; // Call llvm_shutdown() on exit.
  cl::ParseCommandLineOptions(argc, argv);
```

```
While cmake config why specifying LLVM_ROOT/LLVM_DIR is not sufficient
why the correct llvm version need to be there in the env
```

```
Why ssh/config::identify file is required; to avoid  ssh-add identityfile
```

```
why -DLLVM_INSTALL_UTILS is only configured in debug builds
```

```
what happen when we just execute any file
```

```
what is managed static
```
