colorscheme torte

"set textwidth=80
set autoindent
set smartindent
set hlsearch
set cindent
set expandtab
set shiftwidth=2
set softtabstop=2
set ic
set complete+=kspell
set spell spelllang=en_us
se nospell
se number

autocmd FileType c set shiftwidth=2
autocmd FileType c set tabstop=2
autocmd FileType c set softtabstop=2

" Enable mouse scrolling
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

":set formatoptions+=w
":set tw=80

" Map commands for line wrap
" granularity
" fa: full file
" fp: paragraph
" fl: line
map fa gggqG
map fp gqip
map fl gqq


" This is for K syntax highlighting
au BufRead,BufNewFile *.k set filetype=kframework
au! Syntax kframework source kframework.vim
syn on

" This is for llvm syntax highlighting
" copy `utils/vim/syntax/llvm.vim' to
" ~/.vim/syntax and add this code to your ~/.vimrc :
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
" augroup filetype
"  au! BufRead,BufNewFile *.swift     set filetype=swift
"augroup END

" Markdown syntax highlighting
filetype on
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set     filetype=markdown

" Set not compatible mode to enable Vim features.
"set nocp

" File access patterns
map Q :q
map N :n
map k gf
map l :bf

" Plugins management
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
