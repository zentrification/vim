" how to integrated X11 clipboard with vim registers
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard

" setup vundle
" ---------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required by vundle

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" language specific
Bundle 'kchmck/vim-coffee-script'
" add end keyword in ruby
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'

" utility
" extend % to more languages
Bundle 'tsaleh/vim-matchit'
" basically maps tab to vim completion, amazing
Bundle 'tsaleh/vim-supertab'
Bundle 'tpope/vim-surround'
" quickly comment anything
Bundle 'tsaleh/vim-tcomment'
Bundle 'vim-scripts/taglist.vim'
Bundle 'Raimondi/delimitMate'

" colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'

" Bundle 'astashov/vim-ruby-debugger'
" Bundle 'hallison/vim-rdoc'
" Bundle 'Lokaltog/vim-easymotion'
" didn't really like snipmate
" Bundle 'msanders/snipmate.vim'
" Bundle 'rson/vim-conque'
" automatically checks files for syntax errors, worth looking into
" Bundle 'scrooloose/syntastic/'
" Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-markdown'
" Bundle 'tsaleh/vim-align'
" looks super cool, compiling c extension didn't work for some reason
" Bundle 'wincent/Command-T.git'
" Bundle 'zentrification/vim-slim'

" https://github.com/henrik/vim-indexed-search
" https://github.com/xolox/vim-session
" https://github.com/godlygeek/tabular - text aligning
" https://github.com/spiiph/vim-space
" https://github.com/vim-scripts/YankRing.vim
" https://github.com/mileszs/ack.vim
" https://bitbucket.org/ns9tks/vim-autocomplpop/
" https://github.com/vim-scripts/UltiSnips
" https://github.com/nelstrom/vim-textobj-rubyblock
" https://github.com/vim-scripts/mru.vim
" https://github.com/robgleeson/hammer.vim
" https://github.com/sjl/gundo.vim
" https://github.com/vim-scripts/camelcasemotion

""""""""""""""""""""""""""""""""""""""""""""
" git hub how to include folders within repos
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
""""""""""""""""""""""""""""""""""""""""""""
" vim-scripts repos
" Bundle 'FuzzyFinder'
""""""""""""""""""""""""""""""""""""""""""""
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
""""""""""""""""""""""""""""""""""""""""""""

" General
" ---------------------------------------------------------------------------

set history=100000                    " lots of command line history
set cf                                " error files / jumping
set ffs=unix,dos,mac                  " use correct line terminators
filetype plugin indent on             " enable indenting (required for Vundle)
set isk+=_,$,@,%,#,-                  " none word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                          " make sure modeline support is enabled
set autoread                          " reload files (no local changes only)
set tabpagemax=50                     " open 50 tabs max
set hidden                            " marks & history remembered in backgrounded buffers
set autowrite                         " write on make/shell commands
" set clipboard+=unnamed

" Colors / Theme
" ---------------------------------------------------------------------------

syntax on
set hlsearch

if $TERM =~ 'xterm-256color'
  set t_Co=256
  " colorscheme ir_black
  set background=dark
  " colorscheme solarized
endif
if has("macunix")
  let s:uname = system("uname")
  if s:uname == "Darwin"
    colorscheme=inkpot
  endif
endif

set background=dark
colorscheme solarized

"  Highlight
" ---------------------------------------------------------------------------
" highlight Comment         ctermfg=DarkGrey guifg=#444444
" highlight StatusLineNC    ctermfg=Black ctermbg=DarkGrey cterm=bold
" highlight StatusLine      ctermbg=Black ctermfg=LightGrey
" 
" highlight SpecialKey ctermfg=DarkGray ctermbg=Black

"  Backups
" ----------------------------------------------------------------------------

set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap

"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
"set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set scrolloff=5            " move top/bottom of viewport with cursor
set splitbelow

" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set nohlsearch             " don't highlight searches
set visualbell             " shut the fuck up
set cursorline             " highlight current line

" Sounds
" ----------------------------------------------------------------------------
set noerrorbells
set novisualbell

" Mouse
" ----------------------------------------------------------------------------
set mousehide              " Hide mouse after chars typed
set mouse=a                " Mouse in all modes

" Text Formatting
" ----------------------------------------------------------------------------
" read this blog post on tabs
" http://tedlogan.com/techblog3.html

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=120          " wrap at 80 no 120 chars by default
set virtualedit=block      " allow virtual edit in visual block ..
" highlight trailing whitespace as '.' and tabs as '>'
set list listchars=trail:.,tab:>.

" ---------------------------------------------------------------------------
" mappings
" ---------------------------------------------------------------------------
let mapleader = ';'

imap <Leader>; <Esc>
map <Leader>sh :sh<CR>
map <Leader>h :help 
map <Leader>xml :%!ruby ~/bin/xmlformat.rb<CR>
nmap <Leader>r :!!<CR>
nmap <Leader>sn :set invnumber<CR>
nmap <Leader>sp :set invpaste paste?<CR>
" nmap <Leader>t :ConqueTermSplit bash<CR>:set list!<CR>

" search
imap <Leader>s <Esc>:%s/
nmap <Leader>s :%s/

" quitting
nmap <Leader>q :q<CR>
nmap <Leader>qa :qa<CR>
nmap <Leader>Q :q!<CR>

" writing files
nmap <Leader>w :w<CR>
imap <Leader>w <C-o>:w<CR><Esc>
nmap <Leader>x :x<CR>
imap <Leader>x <C-o>:x<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" window split movements
nmap <C-n> <C-w>n
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <Leader>e :e.<CR>
nmap <Leader>se :Se.<CR>
nmap <Leader>wm <C-w>_
" going back and forth mimizes project.vim
nmap <Leader>wn <C-w>=<C-w>h<C-w>l

" tabs
map <Leader>tba <C-o>:tab ball<CR>
imap <Leader>tn <C-o>:tabnew<CR>
nmap <Leader>tn :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" rails.vim
imap <Leader>rc <Esc>:Rcontroller 
nmap <Leader>rc :Rcontroller 
imap <Leader>rj <Esc>:Rjavascript 
nmap <Leader>rj :Rjavascript 
imap <Leader>rl <Esc>:Rlayout 
nmap <Leader>rl :Rlayout 
imap <Leader>rm <Esc>:Rmodel 
nmap <Leader>rm :Rmodel 
imap <Leader>rs <Esc>:Rstylesheet 
nmap <Leader>rs :Rstylesheet 
imap <Leader>rv <Esc>:Rview 
nmap <Leader>rv :Rview 

" coffeescript
imap <Leader>cm <Esc>:CoffeeMake<CR>
nmap <Leader>cm :CoffeeMake<CR>

" Vundle
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" taglist
nnoremap <silent> <F8> :TlistToggle<CR>
nmap <Leader>tla <Esc>:TlistAddFilesRecursive ./ *rb

" Filetypes
" ----------------------------------------------------------------------------
au BufRead,BufNewFile *.txt       set ft=txt

" supertab
" ----------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"

" project.vim
" ---------------------------------------------------------------------------
let g:proj_window_width=30
let g:proj_window_increment=50
let gproj_flags="bimst"

" ruby
" ----------------------------------------------------------------------------
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

