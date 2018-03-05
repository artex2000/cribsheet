"let g:loaded_logipat = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

call plug#begin('~/.vim/plugged')
Plug '~/.vim/bundle/DoxygenToolkit.vim'
Plug 'Valloric/YouCompleteMe'
call plug#end()
set rtp+=~/.fzf
nnoremap <c-p> :Fzf<CR>

let g:mapleader = ","
set timeoutlen=2000

syntax on
filetype plugin on

set background=dark
set t_Co=16
colorscheme solarized

set nobackup
set noswapfile
set number
"set relativenumber

set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cindent 
set shiftround

set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignorecase

set hidden
set nowrap
set textwidth=0

set cursorline
set foldcolumn=1
set colorcolumn=90
highlight ColorColumn ctermbg=0

nnoremap <silent><Space> :noh<CR>
nnoremap K i<CR><Esc>
nnoremap <F2> :set wrap!<CR>

"window splits
set winheight=40
set winminheight=5
set scrolloff=12
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <Leader>h :leftabove vnew<CR>
nnoremap <Leader>l :rightbelow vnew<CR>
nnoremap <Leader>j :leftabove new<CR>
nnoremap <Leader>k :rightbelow new<CR>

"DoxToolkit params
let g:DoxygenToolkit_paramTag_post = " <++>"
let g:DoxygenToolkit_briefTag_post = "<++>"
let g:DoxygenToolkit_returnTag_post = "<++>"
nnoremap <F1> :Dox<CR>
nnoremap <F3> :DoxAuthor<CR>

function! FoldText()
    let line = getline(v:foldstart)
    if stridx(line, '{') == -1
        return '/*..*/'
    else
        return '{...}'
    endif
endfunction

set foldtext=FoldText()
"set foldmethod=marker
"set foldmarker={,}
set foldmethod=syntax
set fillchars=fold:\ 
highlight Folded cterm=NONE ctermbg=NONE
autocmd Syntax c,cpp normal zR
nmap <Leader>o zO
nmap <Leader>c zC
nmap <Leader>r zR
nmap <Leader>m zM

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

function! BuildProject()
    exec ":silent !make"
    exec ":cwindow"
    exec ":redraw!"
endfunction

"command! -nargs=0 Make :call BuildProject()
command! -nargs=0 Mk silent make! | redraw! | botright cwindow
