set +x

if [ "$1" == "unset" ] ; then 
  echo "                       Unsetting GO variables"
  unset GO 
  unset GOPATH 
  unset GOBIN 
  
  PATH=$(echo "$PATH" | sed -e 's/\/home\/sdasgup3\/go\/bin[:]*//g' | sed -e 's/\/home\/sdasgup3\/Github\/go\/bin[:]*//g')
  export PATH

  echo "PATH : "  $PATH
  echo "GOPATH : "  $GOPATH
  echo "GOBIN : "  $GOBIN
  echo "which go : " $(which go)
  echo "which pprof : " $(which pprof)
  return 
fi


echo "                       Setting GO variables"
GO=$HOME/Github/go

GOPATH=$HOME/go
export PATH=$GO/bin:$PATH
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
PROFILER_LIB=/home/sdasgup3/Install/gperftools.install/lib

export PATH=$GOBIN:$PATH

export PATH="$(echo $PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"
export LD_LIBRARY_PATH="$(echo $LD_LIBRARY_PATH | perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, scalar <>))')"

echo "PATH : "  $PATH
echo "LD_LIBRARY_PATH : "  $LD_LIBRARY_PATH
echo "GOPATH : "  $GOPATH
echo "GOBIN : "  $GOBIN
echo "which go : " $(which go)
echo "which pprof : " $(which pprof)



