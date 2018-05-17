# Articles
 - [Google Style Guide](https://google.github.io/styleguide/shell.xml)

# Syntax

## `sed` experience
- Pattern Match
  ```
  Input: <A>...</A> <B>...</B>
  Output:
  <A>...</A>
  <B>...</B>
  Command:
  echo "<A>...</A> <B>...</B>" | sed -e 's/\(<[^</]*>\)/\n\1/g'
  ```
- Delete linesmatching a string
  ```
    sed -e '/string/d'
  ```

- Delete anything between lines matching two regexes
  ``` sed -e '/regex1/,/regex2/d' filename```

- diff
  ```
  diff <(sed -e '/regex1/,/regex2/d' filename ) <(sed -e '/regex1/,/regex2/d' filename)

  diff  -I "sigsegv\|Value\|was read at" <(sed -e 's/TMP_BV_[0-9]*_[0-9]*/TEMP_BV/g' -e 's/TMP_BOOL_[0-9]*/TMP_BOOL/g' file1) <(sed -e 's/TMP_BV_[0-9]*_[0-9]*/TEMP_BV/g'  -e 's/TMP_BOOL_[0-9]*/TMP_BOOL/g' file2)
  ```
- renaming extensions
    - ```for file in `ls *.dot`; do head=$(echo $file | sed -e 's/\(.*\)\.dot$/\1/g') ; mv $file  $head.gold;  done```
- Copying one level up
  ```
  for file in  $(find . -name "*lifted.exe"); do parent=$(echo $file | sed -e 's/McSemaOutput//g');  cp $file $parent; done
  ```
- Delete Empty lines: `sed '/^\s*$/d'`

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
