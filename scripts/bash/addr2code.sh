#!/bin/bash

address=
binfile=./a.out
srcfile=
disasmfile=

usage()
{
    echo "Usage: addr2code.sh -a[ddr] <#pc address> [-b[in] <bin file>] \
      -s[rc] <src file> -d[asm] <dis-assembly file>"
}

sanitycheck() {
  echo "PC address: $address"
  echo "Binary file: $binfile"
  echo "Source file: $srcfile"
  echo "Dis-asm file: $disasmfile"
  echo

  if [ "$address" == "" ]; then
    echo "Address missing: Provide -a"
    exit 1
  fi

  if [ "$binfile" == "" ]; then
    echo "Address missing: Provide -b"
    exit 1
  fi

  if [ "$srcfile" == "" ]; then
    echo "Address missing: Provide -s"
    exit 1
  fi

  if [ "$disasmfile" == "" ]; then
    echo "Address missing: Provide -d"
    exit 1
  fi
}

addr2code() {
  echo

  grep -B 1 $address $disasmfile  | grep "call" | cut -d ':' -f1 | xargs addr2line \
    -e $binfile | cut -d ':' -f 2 | xargs -i sed -n {}p  $srcfile

  echo
}

while [ "$1" != "" ]; do
    case $1 in
        -a | --addr )         shift
                              address=$1
                                ;;
        -b | --bin )          shift
                              binfile=$1
                                ;;
        -s | --src )          shift
                              srcfile=$1
                                ;;
        -d | --dasm )         shift
                              disasmfile=$1
                                ;;
        -h | --help )         usage
                              exit
                                ;;
        * )                   usage
                              exit 1
    esac
    shift
done

sanitycheck
addr2code
