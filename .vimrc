set nocompatible
set number
set ruler
set encoding=utf-8
set lazyredraw
set showmatch
set laststatus=2
set visualbell
set hlsearch
set ignorecase
set autochdir
set statusline+=%F
set relativenumber
set t_Co=256
set t_ut=
set splitbelow
set splitright
set backspace=indent,eol,start
set whichwrap=<,>,h,l
set autoread

filetype off
syntax on

nnoremap <leader>ev :vsplit $MYVIMRC<CR>

"split navigations
nnoremap <s-t> :vsplit .<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"tab navigations
map <leader>l :tabn<CR>
map <leader>h :tabp<CR>
map <leader>n :tabnew<CR>

function! GitCopyUrlRange() range
        execute 'cd %:h'
        execute 'cd `git rev-parse --show-toplevel`'
        execute '! git browse ' . expand('%') . ' ' . a:firstline . ' ' . a:lastline
endfunction

command! -range GitCopyUrl <line1>,<line2>call GitCopyUrlRange()
vmap <C-c> :GitCopyUrl<CR>

"run: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tomasiser/vim-code-dark'

call vundle#end()
filetype plugin indent on
