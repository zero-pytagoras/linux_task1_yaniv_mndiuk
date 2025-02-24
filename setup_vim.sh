# Edit/Create ~/.vimrc to make Vim more approachable

#!/bin/bash

VIMRC="$HOME/.vimrc"

# Define Vim configuration
VIM_CONFIG='
" Enable syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" Enable clipboard support for copying/pasting with system clipboard
set clipboard=unnamedplus

" Better searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Better indentation for coding
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Show matching brackets
set showmatch

" Enable command-line completion
set wildmenu

" Disable annoying Vim swap files
set noswapfile

" Allow backspace over everything
set backspace=indent,eol,start

" Smooth scrolling
set scrolloff=8
set sidescrolloff=8

" Show status bar
set laststatus=2

" Highlight the current line
set cursorline

" Set default encoding
set encoding=utf-8

" Automatically reload file when changed externally
set autoread

" Shorter timeout for key mappings
set timeoutlen=500

" Split windows settings
set splitbelow
set splitright

" Key mappings for easier navigation
nnoremap <Space> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Quick exit with Q
nnoremap Q :q<CR>

'

# Write configuration to ~/.vimrc
if [ -f "$VIMRC" ]; then
    echo "Updating existing ~/.vimrc..."
    echo "$VIM_CONFIG" > "$VIMRC"
else
    echo "Creating new ~/.vimrc..."
    echo "$VIM_CONFIG" > "$VIMRC"
fi

echo "Vim configuration applied successfully!"

