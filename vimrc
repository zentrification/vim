" how to integrated X11 clipboard with vim registers
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard

" config's to pimp
" http://amix.dk/vim/vimrc.html
" https://github.com/sjl/dotfiles/blob/master/vim/.vimrc

" setup leader
" hrm not happy with this leader
" ;; is repeat last f/F/t/T command
" ------------------------------------------------------------
let mapleader = ';'

" setup vundle
" ------------------------------------------------------------
set nocompatible                  " be iMproved
filetype off                      " required by vundle
set rtp+=~/.vim/bundle/vundle/    " let Vundle manage Vundle
call vundle#rc()
Bundle 'gmarik/vundle'
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" recent plugin watch list
" https://github.com/Shougo/neocomplcache
" https://github.com/hsitz/VimOrganizer
" https://github.com/Lokaltog/vim-easymotion
" https://github.com/godlygeek/tabular

" text objects
" ------------------------------------------------------------
" http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
" http://yanpritzker.com/2011/12/16/learn-to-speak-vim-verbs-nouns-and-modifiers/
" ------------------------------------------------------------
" verbs         (v)isual, (c)hange, (d)elete, (y)ank
" modifiers     (i)nside, (a)round, (t)ill, (f)ind
" text objects  (w)ord, (s)entence, (p)aragraph, (b)lock, (t)ag
" ------------------------------------------------------------
Bundle 'kana/vim-textobj-user'
" noun (i)ndent block
Bundle 'michaeljsmith/vim-indent-object'
" noun  (r)uby block
Bundle 'nelstrom/vim-textobj-rubyblock'
" noun  (s)urround - eg cs'" or viwS"
Bundle 'tpope/vim-surround'
" verb  (g)o comment
Bundle 'vim-scripts/tComment'

" automatic closing of quotes, brackets, parenthesis etc
Bundle 'Raimondi/delimitMate'
" extend % to more languages
Bundle 'tsaleh/vim-matchit'
" diff two visual blocks
" Bundle 'vim-scripts/BlockDiff'
Bundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" status line
Bundle 'Lokaltog/vim-powerline'

" Control-P
" fuzzy file finder, MRU, buffer explorer
Bundle 'kien/ctrlp.vim'

" gundo.vim - visual undo tree
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" neocomplcache
" ------------------------------
Bundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,haml,slim setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,coffee,iced setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" language specific
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'bbommarito/vim-slim'
autocmd BufWritePost index.slim !slimrb -p index.slim > index.html

" ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-endwise'
" Bundle 'astashov/vim-ruby-debugger'
" Bundle 'hallison/vim-rdoc'

" rails.vim
Bundle 'tpope/vim-rails'
nnoremap <Leader>rc :Rcontroller
nnoremap <Leader>rj :Rjavascript
nnoremap <Leader>rl :Rlayout
nnoremap <Leader>rm :Rmodel
nnoremap <Leader>rs :Rstylesheet
nnoremap <Leader>rv :Rview
nnoremap <Leader>ra :A
nnoremap <Leader>rr :R

Bundle 'vim-scripts/aspnet.vim--Abshire'
autocmd BufRead,BufNewFile *.aspx set filetype=aspnet
autocmd BufRead,BufNewFile *.ascx set filetype=aspnet

" color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'

" taglist.vim
" Bundle 'vim-scripts/taglist.vim'
" nnoremap <silent> <F8> :TlistToggle<CR>
" nmap <Leader>tla <Esc>:TlistAddFilesRecursive ./ *rb

" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rson/vim-conque'
" automatically checks files for syntax errors, worth looking into
" Bundle 'scrooloose/syntastic/'
" Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-markdown'
" Bundle 'tsaleh/vim-align'
" Bundle 'zentrification/vim-slim'

" https://github.com/henrik/vim-indexed-search
" https://github.com/xolox/vim-session
" https://github.com/godlygeek/tabular - text aligning
" https://github.com/spiiph/vim-space
" https://github.com/vim-scripts/YankRing.vim
" https://github.com/mileszs/ack.vim
" https://bitbucket.org/ns9tks/vim-autocomplpop/
" https://github.com/vim-scripts/UltiSnips
" https://github.com/vim-scripts/mru.vim
" https://github.com/robgleeson/hammer.vim
" https://github.com/sjl/gundo.vim

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
" ------------------------------------------------------------

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
set timeoutlen=350                    " Time to wait after ESC (default causes an annoying delay)
set encoding=utf-8
" set clipboard+=unnamed

" Colors / Theme
" ------------------------------------------------------------
syntax on
set hlsearch

" colorscheme solarized
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_termtrans=1

if $TERM =~ 'xterm-256color'
  set t_Co=256
  colorscheme ir_black
  set background=dark
  " colorscheme solarized
endif
" if has("macunix")
"   let s:uname = system("uname")
"   if s:uname == "Darwin"
"     colorscheme=inkpot
"   endif
" endif

"  Highlight
" ------------------------------------------------------------
" highlight Comment         ctermfg=DarkGrey guifg=#444444
" highlight StatusLineNC    ctermfg=Black ctermbg=DarkGrey cterm=bold
" highlight StatusLine      ctermbg=Black ctermfg=LightGrey
" 
" highlight SpecialKey ctermfg=DarkGray ctermbg=Black

"  Backups
" ------------------------------------------------------------
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap

"  UI
" ------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set wildignore+=.git,.svn
set wildignore+=.jpg,.jpeg,.gif,.png,.tiff
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
"set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set scrolloff=5            " move top/bottom of viewport with cursor
set sidescrolloff=5
set splitbelow

" Visual Cues
" ------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set nohlsearch             " don't highlight searches
set visualbell             " shut the fuck up
set cursorline             " highlight current line

" Sounds
" ------------------------------------------------------------
set noerrorbells
set novisualbell

" Mouse
" ------------------------------------------------------------
set mousehide              " Hide mouse after chars typed
set mouse=a                " Mouse in all modes

" Text Formatting
" ------------------------------------------------------------
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
" highlight trailing whitespace as '~' and tabs as '>'
set list listchars=trail:~,tab:>.


" abbreviations
" ------------------------------------------------------------
ab -- ------------------------------
ab --- ------------------------------------------------------------

ab vbresolve <% =Page.ResolveUrl("") %>

ab Lorum Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

" mappings
" map and noremap are recursive and non-recursive mapping commands
" ------------------------------------------------------------
imap <Leader>; <Esc>
map <Leader>sh :sh<CR>
map <Leader>h :help 
map <Leader>xml :%!ruby ~/bin/xmlformat.rb<CR>
nmap <Leader>r :!!<CR>
nmap <Leader>sn :set invnumber<CR>
nmap <Leader>sp :set invpaste paste?<CR>
" nmap <Leader>t :ConqueTermSplit bash<CR>:set list!<CR>

" make Y consistend with C and D
nnoremap Y y$

" colorschemes
nnoremap <Leader>csi :colorscheme inkpot<CR>
nnoremap <Leader>css :colorscheme solarized<CR>

" jj exists insert
inoremap jj <ESC>
cnoremap jj <ESC>

" sessions
nnoremap <Leader>ws :mksession .vim-session
" autoload session file if it exists
function! RestoreSession()
  if argc() == 0 "vim called without arguments
    if filereadable('.vim-session')
      execute 'source .vim-session'
    end
  end
endfunction
autocmd VimEnter * call RestoreSession()

" explorer
nmap <Leader>e :e.<CR>
nmap <Leader>se :Se.<CR>

" search
imap <Leader>s <Esc>:%s/
nmap <Leader>s :%s/

" quitting
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>

" writing files
nmap <Leader>w :w<CR>
imap <Leader>w <C-o>:w<CR><Esc>
nmap <Leader>x :x<CR>
imap <Leader>x <C-o>:x<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" create fold based on current indent
nnoremap <Leader>fi V}kzf

" simplify window splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
" window split movements
nmap <C-n> <C-w>n
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
" maximize current split
nmap <Leader>wm <C-w>_
" going back and forth mimizes project.vim
nmap <Leader>wn <C-w>=<C-w>h<C-w>l

" tabs
nnoremap <Left>  :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
nnoremap <Up> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Down> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <Leader>tn :tabnew<CR>
" create tabs from all buffers
nnoremap <Leader>tb <C-o>:tab ball<CR>

" coffeescript
imap <Leader>cm <Esc>:CoffeeMake<CR>
nmap <Leader>cm :CoffeeMake<CR>

" ruby
" ------------------------------------------------------------
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" project.vim
" ------------------------------------------------------------
let g:proj_window_width=30
let g:proj_window_increment=50
let gproj_flags="bimst"
