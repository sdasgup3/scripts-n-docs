echo "Search for: $1"
for file in $(find  /home/sdasgup3/Install/llvm-3.8.release.install/lib/ -name "*.a"); do 
  echo $file;
  nm --defined-only $file | grep $1 | c++filt
done
