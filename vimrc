" vimrc-todo-list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. integrated X11 clipboard with vim registers
"     http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" 2. config's to pimp
"     https://github.com/skwp/dotfiles/blob/master/vim/vundles.vim
"     http://amix.dk/vim/vimrc.html
"     https://github.com/sjl/dotfiles/blob/master/vim/.vimrc


let mapleader = ';'
set nocompatible

"" bundles """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vim/vimrc.vundles"))
  source ~/.vim/vimrc.vundles
endif

" set clipboard+=unnamed
set encoding=utf-8
set ffs=unix,dos,mac
set history=100000
set isk+=$,@,%,#,_,-
set list listchars=tab:▸\ ,trail:❤
set tabpagemax=50
set timeoutlen=350
set viminfo='1000,f1,:100,@100,/20

set nolazyredraw
set noshowcmd
set ttyfast

set laststatus=2
set noerrorbells
set novisualbell
set visualbell

set exrc     " .vimrc in cwd
set secure   " disable shell/autocmd
set modeline

set autoread
set hidden
set nobackup
set noswapfile
set nowritebackup

syntax on
set gdefault
set hlsearch
set incsearch
set ignorecase
set smartcase

filetype plugin indent on
set autoindent
set smartindent

set expandtab
set nosmarttab
set softtabstop=2
set shiftwidth=2
set tabstop=4

set nostartofline
set scrolloff=5
set sidescrolloff=7
set sidescroll=1

set cursorline
set mouse=a
set mousehide
set number
set ruler
set splitbelow
set whichwrap+=h,l

set showmatch
set matchtime=3

set wildmenu
set wildmode=list:longest,full
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.bmp,*.ico,*.jpg,*.jpeg,*.gif,*.png,*.tiff
set wildignore+=*~,*.swp,*.tmp

" ??
set backspace=2            " allow backspacing over everything in insert mode
set shortmess=filtIoOA     " shorten messages

set formatoptions+=n       " support for numbered/bullet lists
set nowrap                 " do not wrap lines
set textwidth=160          " wrap at 160 chars by default
set virtualedit=block      " allow virtual edit in visual block ..

if $TERM =~ '256' || $COLORTERM == "gnome-terminal"
  set t_Co=256
  set background=dark
  let g:solarized_termtrans=1
  colorscheme solarized
endif

if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
endif

if filereadable(expand("~/.vim/vimrc.abbreviations"))
  source ~/.vim/vimrc.abbreviations
endif

if filereadable(expand("~/.vim/vimrc.mappings"))
  source ~/.vim/vimrc.mappings
endif
