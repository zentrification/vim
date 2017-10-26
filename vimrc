" Table of Contents
" --------------------------------------------------------------------------------
" vimrc-plugins
" vimrc-settings
" vimrc-mappings
" vimrc-neocomplete
" --------------------------------------------------------------------------------

" vimrc-plugins
" --------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_match_window = 'btop,order:ttb,min:1,max:15'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree',     { 'on':  'UndotreeToggle' }
Plug 'Shougo/vimproc.vim',  { 'do': 'make' }
Plug 'bling/vim-airline'
" show current theme in status bar
" let g:airline_section_a = '%{g:colors_name}'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_delay = 500
let g:peekaboo_window = 'vertical botright 50new'
Plug 'sheerun/vim-polyglot'
let g:javascript_enable_domhtmlcss = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'mhinz/vim-startify'

" themes
Plug 'candycode.vim'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
" explore customizing gruvbox
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'tpope/vim-vividchalk'

call plug#end()

" vimrc-settings
" read :options for docs
" --------------------------------------------------------------------------------
syntax on
filetype plugin indent on
let mapleader = ';'             " switch leader to <Space> ?

set nocompatible

set autoindent
set smartindent

set ignorecase
set infercase
set smartcase

set expandtab
set nosmarttab
set softtabstop=2
set shiftwidth=2
set tabstop=4

set autoread
set cursorline
set encoding=utf-8
set ffs=unix,dos,mac
set gdefault
set history=10000
set hlsearch
set incsearch
set iskeyword+=$,@,%,#,_,-
set laststatus=2
set lazyredraw
" easy visualization of tab and trailing space
set list
set listchars=tab:▸\ ,trail:❤
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set number
set ruler
set secure
set tags=./tags;
set timeoutlen=500
set ttyfast
set showmatch
set wildmenu
set wildmode=list:longest,full

if $TERM =~ '256' || $COLORTERM == "gnome-terminal"
  set t_Co=256
  colorscheme Tomorrow-Night-Bright
endif

if has("persistent_undo")
  set undodir='~/.vim/undodir/'
  set undofile
endif

" --------------------------------------------------------------------------------
" vimrc-mappings
" --------------------------------------------------------------------------------

nnoremap <Leader>e :e.<CR>
nnoremap <Leader>t :tab new <CR>
nnoremap <Leader>v :source ~/.vimrc<CR>

" maybe use function keys more
" nnoremap <F2> :set invnumber<CR>
" nnoremap <F3> :set invpaste paste?<CR>

" make Y consistend with C and D
nnoremap Y y$

" copy to system clipboard
vnoremap <C-c> "*y

" saving
inoremap <Leader>s <ESC>:update<CR>
nnoremap <Leader>s :update<CR>
cmap W :w !sudo tee %

" themes
nnoremap \1 :colorscheme solarized<CR>
nnoremap \2 :colorscheme molokai<CR>
nnoremap \3 :colorscheme Tomorrow-Night-Bright<CR>
nnoremap \4 :colorscheme candycode<CR>
nnoremap \5 :colorscheme vividchalk<CR>
nnoremap \6 :colorscheme hybrid<CR>
nnoremap \7 :colorscheme gruvbox<CR>

" functionality
nnoremap \b  :CtrlPBuffer<CR>
nnoremap \c  :NeoCompleteTagMakeCache<CR>
nnoremap \g  :grep -r --exclude-dir={.git,log} <c-r>=expand("<cword>")<cr> .<cr><cr>:copen<cr>
nnoremap \G  :grep -r --exclude-dir={.git,log} <c-r>=expand("<cword>")
nnoremap \m  :map<CR>
nnoremap \n  :NERDTreeToggle<CR>
nnoremap \nf :NERDTreeFind<CR>
nnoremap \pi :PlugInstall<CR>
nnoremap \t  :TagbarToggle<CR>
nnoremap \u  :UndotreeToggle<CR>

" splits
nnoremap <silent> ss <C-w>s
nnoremap <silent> vv <C-w>v
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" tabs
nnoremap <Left>  :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
inoremap <Left>  <Esc>:tabprevious<CR>
inoremap <Right> <Esc>:tabnext<CR>
nnoremap <Up>    :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Down>  :execute 'silent! tabmove ' . tabpagenr()<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vimrc-neocomplete
" --------------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#tags#cache_limit_size = 500000

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" --------------------------------------------------------------------------------
" plugins
" --------------------------------------------------------------------------------
" http://vimawesome.com/
" http://vimcolors.com/
" https://github.com/flazz/vim-colorschemes
" --------------------------------------------------------------------------------
" watchlist
" --------------------------------------------------------------------------------
" https://github.com/eapache/starscope
" --------------------------------------------------------------------------------
" https://github.com/skwp/greplace.vim
" https://github.com/AndrewRadev/splitjoin.vim
" https://github.com/terryma/vim-multiple-cursors
" https://github.com/justinmk/vim-sneak
" https://github.com/bronson/vim-visual-star-search
" --------------------------------------------------------------------------------

