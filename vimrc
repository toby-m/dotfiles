if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/mayansmoke'

Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'

Plug 'mxw/vim-jsx'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

let g:easytags_cmd = '/usr/local/bin/ctags'
let g:gutentags_cache_dir='~/.tags/'
let g:gutentags_ctags_auto_set_tags=1

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
set nocompatible

syntax on

set backspace=indent,eol,start
set splitright          " when splitting
set splitbelow
set autoread            " auto reread changed files
set number              " line numbers

set cursorline          " highlight cursor line
set hlsearch            " highlight search matches

set mouse=a
set mousehide

set showmatch
set ignorecase
set smartcase
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


" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Remove search highlight and close quickfix
nnoremap <leader><space> :nohlsearch<CR>:cclose<CR>

" ,. for tag search
nnoremap <leader>. :CtrlPTag<cr>

" tags files shouldn't be in each repo

au FileType json setlocal equalprg=json

if !has("gui_running")
  " NERDTree open when started with no args
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack!

" Ignore node_modules for Ctrl-P and nerdtree
set wildignore+=node_modules,__pycache__
let g:NERDTreeIgnore=['node_modules', '__pycache__']
let timeoutlen=2500

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
