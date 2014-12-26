set nocompatible

"Needed to set Vundle"
filetype off
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

"Plugins"
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'

"Javascript Specific"
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'

"Quality of Life"
Plugin 'bronson/vim-trailing-whitespace'
call vundle#end()

"Base vimrc settings"
filetype plugin indent on
set background=dark "needed for darker colorschemes"
colorscheme base16-shapeshifter

" Dealing with tabs
set expandtab
set tabstop=4
set backspace=2
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smarttab

" Editor visual changes
set nowrap
set number
set ruler
set showmatch
set scrolloff=5

" Search changes
set smartcase
set hlsearch
set incsearch

" No error bells or whistles
set visualbell
set noerrorbells

" Statusline stuff
set laststatus=2
set statusline=%n\ %F\ %m%r\%=%c-%l/%L


" Changes for command line tab completion
set wildmode=longest,list,full
set wildmenu

" Misc
set pastetoggle=<F3>
set mouse=a " I like using the mouse
set autoread " I'm going to make it reload anyway

if has("unix")
    set backup
    set backupdir=/tmp
    set directory=/tmp
elseif has("win32")
    set backup
    set backupdir=C:\Windows\Temp
    set noswapfile
endif

if has("win32")
    set guifont=consolas:h9:cANSI
endif

if &t_Co > 2 || has("gui_running")
    syntax on
endif

if has("gui_running")

    set lines=999 "set window to max height"
    set columns=999 "set window to max width"

    set guioptions-=m "remove menubar"
    set guioptions-=T "remove toolbar"

    set cursorline
    hi clear cursorline
    hi cursorline gui=underline
endif

"NerdTree Settings"
map <F2> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

"Airline Settings"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'wombat'

"Javascript Syntex"
let g:used_javascript_libs = 'jquery'

"DelimitMate"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" Keybindings
" Set Leader to Space
nnoremap <SPACE> <Nop>
let mapleader = " "

" Quicker binding to clip board
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P

" SuperTab Settings
let g:SuperTabDefaultCompletionType = "context"
