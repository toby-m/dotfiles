if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/mayansmoke'

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'airblade/vim-gitgutter'

Plug 'rust-lang/rust.vim'
call plug#end()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
set nocompatible
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
set laststatus=2

set gfn=Consolas:h14:cANSI
colorscheme mayansmoke
highlight LineNr ctermfg=grey ctermbg=white
