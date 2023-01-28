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
set statusline=%F\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
set relativenumber
set tags=tags;/
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

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'airblade/vim-gitgutter'
"install code-minimap
"curl https://sh.rustup.rs -sSf | sh
"cargo install --locked code-minimap
Plug 'wfxr/minimap.vim' 

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

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
