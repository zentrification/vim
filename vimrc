" vimrc-todo-list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. integrated X11 clipboard with vim registers
"     http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" 2. config's to pimp
"     https://github.com/skwp/dotfiles/blob/master/vim/vundles.vim
"     http://amix.dk/vim/vimrc.html
"     https://github.com/sjl/dotfiles/blob/master/vim/.vimrc


" vimrc-leader
"   setup leader (need to do this before any mappings)
"   not crazy about ;
"   introduces delay on ;; (repeat last f/F/t/T command)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ';'

" be iMproved
set nocompatible

" vimrc-vundle
"   LEADER: b
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vim/vimrc.vundles"))
  source ~/.vim/vimrc.vundles
endif


" vimrc-general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100000                    " lots of command line history
set cf                                " error files / jumping
set ffs=unix,dos,mac                  " use correct line terminators
set isk+=_,$,@,%,#,-                  " none word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                          " make sure modeline support is enabled
set autoread                          " reload files (no local changes only)
set tabpagemax=50                     " open 50 tabs max
set hidden                            " marks & history remembered in backgrounded buffers
set autowrite                         " write on make/shell commands
set timeoutlen=350                    " Time to wait after ESC (default causes an annoying delay)
set encoding=utf-8
" set clipboard+=unnamed

" enable per project .vimrc, secure by disabling shell/autocmd
set exrc
set secure


"  vimrc-backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap


"  vimrc-ui
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
if has("wildmenu")
  set wildmenu               " turn on wild menu
  set wildmode=list:longest,full
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.tiff,*.bmp,*.ico,*.jpg,*.png
  set wildignore+=*~,*.swp,*.tmp
endif
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
"set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set splitbelow
" scrolling
set scrolloff=5
set sidescrolloff=7
set sidescroll=1


" vimrc-mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mousehide              " Hide mouse after chars typed
set mouse=a                " Mouse in all modes


" vimrc-theme-colors
"   LEADER: cs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set hlsearch

if $TERM =~ '256' || $COLORTERM == "gnome-terminal"
  set t_Co=256
  " colorscheme ir_black
  set background=dark
  let g:solarized_termtrans=1
  colorscheme solarized
endif

" highlight Comment         ctermfg=DarkGrey guifg=#444444
" highlight StatusLineNC    ctermfg=Black ctermbg=DarkGrey cterm=bold
" highlight StatusLine      ctermbg=Black ctermfg=LightGrey
" highlight SpecialKey ctermfg=DarkGray ctermbg=Black


" vimrc-visual-cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set hlsearch             " don't highlight searches
set noerrorbells
set novisualbell
set visualbell             " shut the fuck up
set cursorline             " highlight current line

" vimrc-text-formatting
"   read this post on tabs http://tedlogan.com/techblog3.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap                 " do not wrap lines
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=160          " wrap at 160 chars by default
set virtualedit=block      " allow virtual edit in visual block ..
" highlight trailing whitespace as '~' and tabs as '>'
set list listchars=tab:▸\ ,trail:❤


" vimrc-indents-tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set autoindent
set smartindent

set expandtab
set nosmarttab
set softtabstop=2
set shiftwidth=2
set tabstop=4


" vimrc-sessions
"   LEADER: w
"   sessions are useful for saving all open tabs/buffers/panes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>ws :mksession .vim-session

" automatically load session file in cwd if it exists
" hrm does this fire on new tabs ?
function! RestoreSession()
  if argc() == 0 "vim called without arguments
    if filereadable('.vim-session')
      execute 'source .vim-session'
    end
  end
endfunction
autocmd VimEnter * call RestoreSession()


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
