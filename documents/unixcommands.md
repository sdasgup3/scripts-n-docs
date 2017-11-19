## Commands
- sed
  - delete anything between lines matching two regexes ``` sed -e '/regex1/,/regex2/d' filename```
  - ``` diff <(sed -e '/regex1/,/regex2/d' filename ) <(sed -e '/regex1/,/regex2/d' filename) ```
  - renaming extensions
    - ```for file in `ls *.dot`; do head=$(echo $file | sed -e 's/\(.*\)\.dot$/\1/g') ; mv $file  $head.gold;  done```
  - Copying one level up
  ```
  for file in  $(find . -name "*lifted.exe"); do parent=$(echo $file | sed -e 's/McSemaOutput//g');  cp $file $parent; done
  ```

```
ls -al commands.txt | cut -d '/' -f 2
sort -t <delim> -k <field>
du -sh .
svn stat | grep "^[?]" | tr -s ' ' | cut -d ' ' -f 2 | xargs rm -rf
gcc -x c++ -v -E /dev/null
```
- Processor details
- ```nproc``` to be passed in make -j N
- Num of sockets/cores/cpus
```
$ lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                16
On-line CPU(s) list:   0-15
Thread(s) per core:    2
Core(s) per socket:    4
Socket(s):             2
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 26
Stepping:              5
CPU MHz:               1596.000
BogoMIPS:              5319.11
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              8192K

There are 2 sockets, each containing 4 cores, each core containing 2 cpus. #cpus = 2*4*2
```

##.inputrc
```
# Key bindings, up/down arrow searches through history
"\e[A": history-search-backward
"\e[B": history-search-forward
"\eOA": history-search-backward
"\eOB": history-search-forward
```


##update and upgrade
- ```sudo apt-get update && sudo apt-get upgrade```
