set gfn=Consolas:h14:cANSI
colorscheme mayansmoke

set nocompatible

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
syntax on
set number
set mouse=a
set mousehide

set cursorline
set hlsearch
set showmatch
set ignorecase
set autoindent
set smartindent
set history=1000
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" autocmd FileType json set equalprg=~/bin/tidyjson.exe
