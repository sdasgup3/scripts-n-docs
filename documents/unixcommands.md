# Commands
## `sed` experiences
- Pattern Match
```
Input: <A>...</A> <B>...</B>
Output:
<A>...</A>
<B>...</B>
Command:
echo "<A>...</A> <B>...</B>" | sed -e 's/\(<[^</]*>\)/\n\1/g'
```

- Delete anything between lines matching two regexes
``` sed -e '/regex1/,/regex2/d' filename```

- ``` diff <(sed -e '/regex1/,/regex2/d' filename ) <(sed -e '/regex1/,/regex2/d' filename) ```
- renaming extensions
    - ```for file in `ls *.dot`; do head=$(echo $file | sed -e 's/\(.*\)\.dot$/\1/g') ; mv $file  $head.gold;  done```
- Copying one level up
  ```
  for file in  $(find . -name "*lifted.exe"); do parent=$(echo $file | sed -e 's/McSemaOutput//g');  cp $file $parent; done
  ```
