runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin on

set background=dark
set t_Co=16
colorscheme solarized

set nobackup
set number
"set relativenumber

set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cindent 

set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden
set nowrap

:noremap <silent> <Space> :silent noh<Bar>echo<CR>
nnoremap K i<CR><Esc>
