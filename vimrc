" TABLE OF CONTENTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc-todo-list
" vimrc-plugins-watching
"
" vimrc-leader
" vimrc-vundle
"
" vimrc-language-specific
" vimrc-rails
"
" vimrc-general
" vimrc-backups
" vimrc-ui
" vimrc-mouse
" vimrc-theme-colors
" vimrc-visual-cues
" vimrc-text-formatting
" vimrc-indents-tabs
"
" vimrc-abbreviations
" vimrc-mappings
" vimrc-sessions
" vimrc-splits
" vimrc-tabs
" vimrc-text-objects
"
" vimrc-autocomplete
" vimrc-misc-utilities
" vimrc-tags


" vimrc-todo-list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. break out configs into their own dirs like
"     https://github.com/skwp/dotfiles/tree/master/vim/
" 2. integrated X11 clipboard with vim registers
"     http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" 3. config's to pimp
"     http://amix.dk/vim/vimrc.html
"     https://github.com/sjl/dotfiles/blob/master/vim/.vimrc


" vimrc-plugins-watching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundle 'scrooloose/syntastic/'
" Bundle 'tpope/vim-repeat'
" Bundle 'tsaleh/vim-align'
" https://github.com/hsitz/VimOrganizer
" https://github.com/Lokaltog/vim-easymotion
" https://github.com/henrik/vim-indexed-search
" https://github.com/xolox/vim-session
" https://github.com/spiiph/vim-space
" https://github.com/vim-scripts/YankRing.vim
" https://github.com/mileszs/ack.vim
" https://bitbucket.org/ns9tks/vim-autocomplpop/
" https://github.com/vim-scripts/UltiSnips
" https://github.com/robgleeson/hammer.vim


" vimrc-leader
"   setup leader (need to do this before any mappings)
"   not crazy about ;
"   introduces delay on ;; (repeat last f/F/t/T command)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ';'


" vimrc-vundle
"   LEADER: b
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                  " be iMproved
filetype off                      " required by vundle
set rtp+=~/.vim/bundle/vundle/    " let Vundle manage Vundle
call vundle#rc()
Bundle 'gmarik/vundle'
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR>
nmap <Leader>bc :BundleClean<CR>


" vimrc-language-specific
"   LEADER: c
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'kchmck/vim-coffee-script'
imap <Leader>cm <Esc>:CoffeeMake<CR>
nmap <Leader>cm :CoffeeMake<CR>

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'StanAngeloff/php.vim'
Bundle 'slim-template/vim-slim'

" ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-endwise'
" Bundle 'astashov/vim-ruby-debugger'
" Bundle 'hallison/vim-rdoc'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold

Bundle 'vim-scripts/aspnet.vim--Abshire'
autocmd BufRead,BufNewFile *.aspx set filetype=aspnet
autocmd BufRead,BufNewFile *.ascx set filetype=aspnet


" vimrc-rails
"   LEADER: r
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'tpope/vim-rails'
nnoremap <Leader>rt :RT 
nnoremap <Leader>rs :RS 
nnoremap <Leader>rv :RV 


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
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'

nnoremap <Leader>csm :colorscheme molokai<CR>
nnoremap <Leader>css :colorscheme solarized<CR>
nnoremap <Leader>csv :colorscheme vividchalk<CR>

syntax on
set hlsearch

if $TERM =~ '256' || $COLORTERM == "gnome-terminal"
  set t_Co=256
  " colorscheme ir_black
  set background=dark
  colorscheme solarized
  let g:solarized_termtrans=1
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

" temporarily disable highlighting
" makes more sense as <C-l> but thats mapped to window split movement
nnoremap \l :nohlsearch<CR>
" toggle search options
nnoremap \i :set incsearch!<CR>
nnoremap \h :set hlsearch!<CR>


" vimrc-text-formatting
"   read this post on tabs http://tedlogan.com/techblog3.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap                 " do not wrap lines
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=160          " wrap at 160 chars by default
set virtualedit=block      " allow virtual edit in visual block ..
" highlight trailing whitespace as '~' and tabs as '>'
set list listchars=trail:~,tab:>.


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

" control indentation with tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" switch between tabbing styles
function! Four_tab()
  :set expandtab tabstop=4 shiftwidth=4 softtabstop=4
endfunction
function! Two_tab()
  :set expandtab tabstop=2 shiftwidth=2 softtabstop=2
endfunction

" tabular.vim - tab align text on regexp
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Bundle 'godlygeek/tabular'
nnoremap <Leader>a V}:Tab /
vnoremap <Leader>a :Tab /

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 3


" vimrc-abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab dl-  --------------------------------------------------------------------------------
ab dl#  ################################################################################
ab dl/  ////////////////////////////////////////////////////////////////////////////////
ab dl/* /*******************************************************************************
ab dl" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ab vbresolve <% =Page.ResolveUrl("") %>

ab Lorum Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


" vimrc-mappings
"   map and noremap are recursive and non-recursive mapping commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>h :help 
nnoremap <Leader>r :!!<CR>
nnoremap <Leader>sh :sh<CR>

nnoremap <Leader>v :source ~/.vimrc<CR>
nnoremap <Leader>xml :%!ruby ~/bin/xmlformat.rb<CR>

nnoremap <Leader>sn :set invnumber<CR>
nnoremap <Leader>sp :set invpaste paste?<CR>

" make Y consistend with C and D
nnoremap Y y$

" quick escape from insert/visual mode
inoremap jk <ESC>
inoremap jkl <ESC>A
cnoremap jk <ESC>

" explorer
nnoremap <Leader>e :e.<CR>
nnoremap <Leader>se :Se.<CR>

" search
nnoremap <Leader>s :%s/

" quitting
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" writing files
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <C-o>:w<CR><Esc>
nnoremap <Leader>x :x<CR>
inoremap <Leader>x <C-o>:x<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" create fold based on current indent
nnoremap <Leader>fi V}kzf

" make & trigger :&& so it preserves flags
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>


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


" vimrc-splits
"   LEADER: s, v, w, Ctrl
"   vv/ss split current pane
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" navigate splits with Ctrl + j/k/h/l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" horizontal split resizing
nnoremap + 5<C-w>+
nnoremap - 5<C-w>-
" vertical split resizing
nnoremap > 9<C-w>>
nnoremap < 9<C-w><
" quickly maximize
nnoremap <Leader>wm <C-w>_


" vimrc-tabs
"   LEADER: t
"   left/right arrow keys move between tabs
"   up/down reorders tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Left>  :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
nnoremap <Up>    :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Down>  :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap <Leader>t  :tabnew<CR>:e.<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tb <C-o>:tab ball<CR>


" vimrc-text-objects
"   verbs         (v)isual, (c)hange, (d)elete, (y)ank
"   modifiers     (i)nside, (a)round, (t)ill, (f)ind
"   text objects  (w)ord, (s)entence, (p)aragraph, (b)lock, (t)ag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
"   http://yanpritzker.com/2011/12/16/learn-to-speak-vim-verbs-nouns-and-modifiers/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Bundle 'vim-scripts/closetag.vim'

" diff two visual blocks
" Bundle 'vim-scripts/BlockDiff'


" vimrc-autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1

" obsoled neocomplcache
" Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/neosnippet'
" unite.vim tutorial (can act like ctrl-p, ack, yankring and lustyjuggler)
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" Bundle 'Shougo/unite.vim'


"   vimrc-misc-utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Lokaltog/vim-powerline'

" Control-P - fuzzy file finder, MRU, buffer explorer
Bundle 'kien/ctrlp.vim'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 15

" file viewer
Bundle 'scrooloose/nerdtree'
nnoremap \t :NERDTreeToggle<CR>

" gundo.vim - visual undo tree
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
endif


"   vimrc-tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags,tags

Bundle 'majutsushi/tagbar'
nnoremap \tb :TagbarToggle<CR>
let g:tagbar_type_coffee = {
  \ 'ctagstype' : 'coffee',
  \ 'kinds' : [
  \   'f:functions',
  \   'v:variables'
  \ ],
  \ }

Bundle 'vim-scripts/taglist.vim'
let g:tlist_coffee_settings = 'coffee;f:function;v:variable'
nnoremap \tl :TlistToggle<CR>
" nmap <Leader>tla <Esc>:TlistAddFilesRecursive ./ *rb
