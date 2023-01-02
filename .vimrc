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
Plugin 'airblade/vim-gitgutter'
"install code-minimap
"curl https://sh.rustup.rs -sSf | sh
"cargo install --locked code-minimap
Plugin 'wfxr/minimap.vim' 

call vundle#end()
filetype plugin indent on

set updatetime=500

hi GitGutterAdd     guifg=#009900 ctermfg=2
hi GitGutterChange  guifg=#bbbb00 ctermfg=3
hi GitGutterDelete  guifg=#ff2222 ctermfg=1

hi MinimapCustCursor ctermbg=59 guibg=#FFFFFF guifg=#FFFFFF
hi MinimapCustDiffAdd ctermfg=Green guibg=#32302F guifg=#50FA7B
hi MinimapCustCursorDiffAdd ctermbg=59 ctermfg=Green
hi MinimapCustDiff ctermfg=228 guibg=#32302F guifg=#50FA7B

let g:minimap_git_colors = 1
let g:minimap_highlight_range = 0
let g:minimap_cursor_color = 'MinimapCustCursor'
let g:minimap_diffadd_color = 'MinimapCustDiffAdd'
let g:minimap_cursor_diffadd_color = 'MinimapCustCursorDiffAdd'
let g:minimap_diff_color = 'MinimapCustDiff'
let g:minimap_cursor_diff_color = 'minimapCursor'
