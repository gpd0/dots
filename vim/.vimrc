" Vim RC Config

set number
set clipboard=unnamed
set path+=**
set autoread
au FocusGained,BufEnter * :silent! !
set encoding=utf-8

set nobackup
set noswapfile
set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set autoindent
set showmode showcmd
set showmatch

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
source ~/.vim/plugins.vim

syntax enable
set background=dark  " or set background=light for light mode
colorscheme everforest

" NERD Tree ----
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-o> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

let g:NERDTreeFileLines = 1
" ---
