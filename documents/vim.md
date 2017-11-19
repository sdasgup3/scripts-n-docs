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

### Plugin management
  - [Instructions](https://github.com/VundleVim/Vundle.vim)

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
insert the code in .vimrc
or add more plugins from https://vimawesome.com/
Launch vim and run :source % and :PluginInstall


```
### Hex editing
```
:%!xxd
:%!xxd -r

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
  select just `\emph{ABC}`. For that instead of * use \{-} i.e
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
