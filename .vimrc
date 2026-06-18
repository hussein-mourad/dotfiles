" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable mouse support
set mouse=a

" Set indentation settings
set tabstop=4       " Number of spaces per tab
set shiftwidth=4    " Number of spaces for autoindent
set expandtab       " Convert tabs to spaces
set autoindent      " Auto-indent new lines

" Enable search options
set ignorecase      " Case-insensitive search
set smartcase       " Case-sensitive if uppercase is used
set hlsearch        " Highlight search results
set incsearch       " Incremental search

" Better backspace
set backspace=indent,eol,start

" Enable clipboard support (for system clipboard)
set clipboard=unnamedplus

" Use 256 colors
set t_Co=256

" Show matching parentheses
set showmatch

" Save undo history
set undofile

" Enable wildmenu for better command completion
set wildmenu

" Key mappings
nnoremap <Space> :noh<CR>  " Clear search highlights
