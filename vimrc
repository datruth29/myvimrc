set nocompatible

"Needed to set Vundle"
filetype off
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

"Plugins"
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/matchit'
Plugin 'w0rp/ale'


"Colorschemes"
Plugin 'lsdr/monokai'
Plugin 'tomasr/molokai'

"Language Specific"
"Python"
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'

"Javascript"
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'

" C/C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Postgresql
Plugin 'exu/pgsql.vim'

"Quality of Life"
Plugin 'bronson/vim-trailing-whitespace'
call vundle#end()

"Base vimrc settings"
filetype plugin indent on
colorscheme monokai


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

"Javascript Syntex"
let g:used_javascript_libs = 'jquery'

"DelimitMate"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" EasyTags
set tags=./tags;$HOME/vimtags;

" Syntastic "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=[]
let g:syntastic_javascript_checkers=[]
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_flake8_post_args = "--max-line-length=99"
highlight link SyntasticError Error
highlight link SyntasticWarning WarningMsg

" Python-Mode "
let g:pymode_lint_on_write = 0
let g:pymode_folding = 0
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_rope = 0
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_options_max_line_length = 99

" Jedi "
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"

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
