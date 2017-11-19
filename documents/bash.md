# Syntax

## Split string
```
Let cat ~/junk/x
code:1
elapsed:2
name:3
code:4
elapsed:5
name:6

and we need to have:
1,2,3
4,5,6

a=$(grep "code" ~/Junk/x | tr -d '\n')
b=$(grep "elapsed" ~/Junk/x | tr -d '\n')
c=$(grep "name" ~/Junk/x | tr -d '\n')

IFS=',' read -r -a array_a <<< "$a"
IFS=',' read -r -a array_b <<< "$b"
IFS=',' read -r -a array_c <<< "$c"


for ((i=0,j=0,k=0;i<140;i++,j++,k++)); do
  echo "${array_a[$i]},${array_b[$j]},${array_c[$k]}";
done

```


## C like for loops
```
IFS=$'\n' read -d '' -r -a lines1 < fileList.txt
IFS=$'\n' read -d '' -r -a lines2 < ~/Junk/x
im2_files=$(cat ~/Junk/x)

for ((i=1,j=1;i<=140, j<= 140;i++,j++)); do
  echo " ${lines1[$i]},${lines2[$j]}";
done

```

## Colors and formatting
```
https://misc.flogisoft.com/bash/tip_colors_and_formatting
```
Note make is using sh to execute the commands by default. So to have formatting from Makefile, add
```
SHELL = bash
```

## Examples
```
for file in $(find . -name "*.c" -o -name "*.cc" -o -name "*.cpp"); do
  if [ "${ECHO}" == "--echo" ] ; then
    echo
    echo "Processing $file";
    echo "${INS} $file -- > $file.tmp";
    echo mv $file.tmp $file;
  else
    ${INS} $file -- > $file.tmp;
    mv $file.tmp $file;
  fi
done
```

## Passing arguments as is
- http://stackoverflow.com/questions/4824590/propagate-all-arguments-in-a-bash-shell-script

## Sourcing Vs Executing a script
- When  source a file, its contents will be executed in the current shell, instead of spawning a subshell.


## Exit from current sourced script
-   When  source a file, its contents will be executed in the current shell and hence everything, including exit, will affect the current shell.  Instead of using exit, you will want to use return.
