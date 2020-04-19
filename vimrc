set nocompatible

call plug#begin('~/vimfiles/bundle')
"Plugs"
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'tmhedberg/matchit'
Plug 'skywind3000/asyncrun.vim'
Plug 'nvie/vim-flake8', {'for': 'python'}
"Colorschemes"
Plug 'lsdr/monokai'
Plug 'tomasr/molokai'

"Language Specific"
"Python"

"Quality of Life"
Plug 'bronson/vim-trailing-whitespace'
call plug#end()

"Base vimrc settings"
colorscheme molokai

" Dealing with tabs
set expandtab
set tabstop=4
set backspace=2
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smarttab
set cino=(0

" Editor visual changes
set nowrap
set number
set relativenumber
set ruler
set showmatch
set scrolloff=5
set completeopt=menuone,longest

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

" Autocmds
au FileType * setlocal formatoptions-=r formatoptions-=o
au FileType python set omnifunc=pythoncomplete#Complete

" Changes for command line tab completion
set wildmode=longest:list,full
set wildmenu

" Misc
set pastetoggle=<F3>
set mouse=a " I like using the mouse
set autoread " I'm going to make it reload anyway

if has("unix")
    set backup
    set backupdir=/tmp
    set directory=/tmp
elseif has("win32") || has("win64")
    set backup
    set backupdir=C:\\vimtemp
    set noswapfile
endif

if has("win32") || has("win64")
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
let g:airline_theme = 'molokai'

"DelimitMate"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" Python-Mode "
" let g:pymode_lint = 0
" let g:pymode_lint_on_write = 0
" let g:pymode_folding = 0
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'
" let g:pymode_virtualenv = 1
" let g:pymode_breakpoint = 0
" let g:pymode_rope = 0
" let g:pymode_syntax = 0
" let g:pymode_syntax_all = 0
" let g:pymode_syntax_space_errors = 0
" let g:pymode_options_max_line_length = 99

" Jedi "
" " let g:jedi#auto_vim_configuration = 1
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = 2
" let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#use_splits_not_buffers = "left"

" Syntax highlighting file extensions "
au BufNewFile,BufRead *.md set syntax=markdown


" Keybindings
" Set Leader to Space
nnoremap <SPACE> <Nop>
let mapleader = " "

" Quicker binding to clip board
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P

" Create new lines without going into insert mode
nmap <Leader><CR> m`o<ESC>``

" Flake8
autocmd BufWritePost *.py call Flake8()

" Python Highlighting
let python_highlight_all = 1

"Neovim Python"
let g:python3_host_prog='C:/Userse/Adam Collado/.virtualenvs/nvim3/Scripts/python.exe'
