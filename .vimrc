" Stupid hack for the py 3.7 deprecation issue
if has('python3')
     silent! python3 1
endif

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

" removes the <number> from <number>w with <leader><leader>w
Plugin 'Lokaltog/vim-easymotion'
" RipGrep Search
Plugin 'jremmen/vim-ripgrep'
" THE DEVIL - auto close quotes kill with  b:delimitMate_autoclose = 0
"Plugin 'Raimondi/delimitMate'
" Code Completion Server
Plugin 'Valloric/YouCompleteMe'
" Async syntax and linter
Plugin 'dense-analysis/ale'
" Align Text
Plugin 'godlygeek/tabular'
" FzF Fuzzy Finder Integration
Plugin 'junegunn/fzf'
" Prose Writing distraction free mode
Plugin 'junegunn/goyo.vim'
" Text alignment and spacing
Plugin 'junegunn/vim-easy-align'
"Fuzzy Finder for buffers etc
Plugin 'ctrlpvim/ctrlp.vim'
" Colorize text with Hash matches #rrggbb
Plugin 'lilydjwg/colorizer'
" Show diff in the gutter/side col
Plugin 'mhinz/vim-signify'
" Toggle and fix common mispellings
Plugin 'tpope/vim-abolish'
" Comment stuff out This is great
Plugin 'tpope/vim-commentary'
" Async Build and Test runner :Make[!] :Dispatch b:dispatch='rustc %'
Plugin 'tpope/vim-dispatch'
" Shell cmd shortcuts :Delete, :Move, :Unlink, etc.
Plugin 'tpope/vim-eunuch'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" project structure metadat
Plugin 'tpope/vim-projectionist'
" Repeat plugin maps
Plugin 'tpope/vim-repeat'
" Sets a bunch of default values
Plugin 'tpope/vim-sensible'
" improved mappings for guns/vim-sexp (S mappings)
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
" Autodetect indent rules
Plugin 'tpope/vim-sleuth'
" Visual Indentation Guides
Plugin 'Yggdroot/indentLine'
" Surrounding ysiw, cs"' etc
Plugin 'tpope/vim-surround'
" XML/HTML Tag Completion and Closing
Plugin 'tpope/vim-unimpaired'
" - to access directory tree
Plugin 'tpope/vim-vinegar'
" PYTHON PLUGINS
Plugin 'alfredodeza/pytest.vim'
" DOCKER PLUGINS
Plugin 'ekalinin/dockerfile.vim'
" CTags Manager
Plugin 'ludovicchabant/vim-gutentags'
" Logstash config syntax
Plugin 'robbles/logstash'
" Make Quickfix list editable for bulk changes
Plugin 'stefandtw/quickfix-reflector.vim'

" JAVASCRIPT PLUGINS
Plugin 'marijnh/tern_for_vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'sheerun/vim-polyglot'
Plugin 'stephpy/vim-yaml'
Plugin 'mxw/vim-jsx'

" RUST PLUGINS
" the big one
Plugin 'rust-lang/rust.vim'
" Rust Clippy
"Plugin 'wagnerf42/vim-clippy'
" on the fly class outliner from tags 
Plugin 'majutsushi/tagbar'
" Racer integration, which is now handled by YCM
"Plugin 'racer-rust/vim-racer'
Plugin 'lepture/vim-jinja'

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
set spelllang=en_us
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
let $RUST_SRC_PATH = '~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:ycm_rust_src_path = '~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
set hidden
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer=1
"let g:ale_linters = {'rust':['rls', 'cargo']}
let g:ale_linters = {'rust':['cargo']}
let g:ale_fixers = {'rust':['cargo', 'rustfmt']}
set tags=./tags,tags,~/src/threatx/tags,~/src/rust/tags
"let g:syntastic_rust_checkers=['cargo','clippy']

" Run rustc then cargo check then clippy. Clippy has a LOT of false positives
" We don't use rustc as it only examines one file at a time

" PYTHON SETTINGS
let g:ycm_python_binary_path='python'
let g:syntastic_python_checkers=['pyflakes']

" Syntastic settings
let g:syntastic_always_populate_loc_list=0
" auto open error list if errors detected
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_auto_jump=0
let g:syntastic_debug=1
" local file don't auto-check on open
" b:syntastic_mode='passive'

" Configure ctrl-p to use RipGrep for search
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif
