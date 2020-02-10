## Record and Replay
  1. Start recording by pressing q, followed by a lower case character to name the macro
  2. Perform any typical editing, actions inside Vim editor, which will be recorded
  3. Stop recording by pressing q
  4. Play the recorded macro by pressing @ followed by the macro name
  5. To repeat macros multiple times, press "NN @ macro name". NN is a number

## Join n consecutive lines
```
:g/^/,+n join
https://groups.google.com/forum/#!topic/comp.editors/FeZGnZMVjSc
```

## Set working diectory to current file
```
To change to the directory of the currently open file (this sets the current directory for all windows in Vim):

:cd %:p:h

You can also change the directory only for the current window (each window has a local current directory that can be different from Vim's global current directory):

:lcd %:p:h

In these commands, % gives the name of the current file, %:p gives its full path, and %:p:h gives its directory (the "head" of the full path).

Automatically change the current directory as sometimes it is helpful if your working directory is always the same as the file you are editing. To achieve this, put the following in your vimrc:

set autochdir
```

## 80 char warning
```
set colorcolumn=80

```


## Changing case with regular expressions (\U \L)
For example, assume a line with the text "This is a test".
```
:s/\(test\)/\U\1 file/
produces: This is a TEST FILE

:s/\(test\)/\U\1\e file/
produces: This is a TEST file
```

## Upper/Lower case
```
u and U for lower/upper case respectively.
```

## Swap the verticle split
`Cltr-w-r`

## Incrementing Selected Numbers
Input
```
text1text
text1text
```
Output:
```
text1text
text2text
```

 - With the cursor on the first 1 in the first line, start a blockwise select by pressing Ctrl-V .
- Move the cursor down to select the first column of zeros, then press `g Ctrl-A`

## Making or replacing a text  with list

  - `:<LNE NUMBER>put =range(11,15)`
  - `:put =map(range(1,150), 'printf(''%04d'', v:val)')`
  - `:for i in range(1,10) | put ='192.168.0.'.i | endfor`

 - Substitute with ascending numbers
   - Suppose you want to replace each occurrence of "abc" with "xyz_N" where N is an ascending number (xyz_1, xyz_2,  xyz_3, and so on).

   `:let i=1 | g/abc/s//\='xyz_'.i/ | let i=i+1`

## Record and Replay
```
// record
:let @q = "JJj"
or type
qqJjq
// replay
500@q
```

## Indent
```
Cntl-V and select the lines
N <Shift> < or N <Shift> >
```

### Hex Editor
```
:%!xxd
//make changes
:%!xxd -r
:w
gg=G
```


### Encode Bash color Code
```
https://vim.sourceforge.io/scripts/script.php?script_id=302

Usage:  edit a file containing escape sequences, then type :AnsiEsc

install details
vim AnsiEsc.vba.gz
:so %
:q
```
### Syntax manager
```
To install, copy (or link) "kframework.vim" file into the ~/.vim/syntax
directory and add the following to your ~/.vimrc file

au BufRead,BufNewFile *.k set filetype=kframework
au! Syntax kframework source kframework.vim
syn on
```


### Removing leading training whitespaces
```
:s/^\s\+//g
:s/\s\+$//g
```
### Interactive replace
``` /gc ```

### Joing multi line
``` 15 shift j ```

### Formatting
```
gq}
gg=G
```


### Greedy Matern match
- Suppose we have `{\tt\emph{ABC}}, {\tt\emp{XYZ}}` and we want to get `{\tt
  ABC}, {\tt XYZ}`. For that, doing `%s/\\emph{\(.*\)}/ \1 /gc` will consider
  the longest match and select `\emph{ABC}}, {\tt\emp{XYZ}}`, but we want to
  select just `\emph{ABC}`. For that instead of * use \\{-} i.e
```
%s/\\emph{\(.\{-}\)}/ \1/gc
```
- [For more info](http://vim.1045645.n5.nabble.com/non-greedy-pattern-matching-td1153340.html)

### Replace Examples
- replace (PAT_pat) with PAT_pat
```
:%s/(\(PAT.*\))/\1/gc
```
- replace return pat;  with func(arg); \nreturn  pat;
```
:%s/\(return .*;\)/func(arg);^M\1/gc
```
**Note: ^M comes with cntrl-Shift-vm*

###Auto wrap beyond 80 characters
```
:set formatoptions+=w
:set tw=80
gggqG

map w gggqG
map wp gqip
map wl gqq
```
