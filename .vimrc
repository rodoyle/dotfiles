set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" All of your Plug Ins must be added before the following line
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'alfredodeza/pytest.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'digitaltoad/vim-pug'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/fzf'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'marijnh/tern_for_vim'
Plugin 'mhinz/vim-signify'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'racer-rust/vim-racer'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'wookiehangover/jshint.vim'
Plugin 'mxw/vim-jsx'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :BundleinUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Bundlein stuff after this line

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

set visualbell
" Character styles
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set list
set binary
set mouse=a
" incremental search
set incsearch
" highlighted search results
set hlsearch
" syntax highlight on
syntax on
" show line numbers
set nu
" Spelling
set spelllang=en_gb
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell
" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
   call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
   call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
   call mkdir(&undodir, "p")
endif
" JAVASCRIPT SETTINGS
let g:jsx_ext_required = 0 "Allow JSX in normal JS files
let g:syntastic_javascript_checkers=['eslint']
let g:JSHintHighlightErrorLine = 0 "Don't make entire line highlighted
" RUST LANG SETTINGS
" Rust Source Directory for Completion
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer=1
let $RUST_SRC_PATH = '~/src/rust/src'
let g:syntastic_rust_checkers=['rustc']
let g:ycm_python_binary_path='python'
let g:ycm_rust_src_path = '~/src/rust/src'
let g:ycm_always_populate_location_list=1
" set default user ctags path
" Syntastic settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_check_on_wq=0

