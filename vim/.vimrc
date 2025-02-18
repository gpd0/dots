" Vim RC Config

" LOAD PLUGINS ---
source ~/.vim/plugins.vim
" ---

set number
set mouse=a
set clipboard=unnamed
set path+=**
set autoread
au FocusGained,BufEnter * :silent! !
au FocusGained,BufEnter * :checktime
set encoding=UTF-8

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

syntax enable
set background=dark  " or set background=light for light mode
colorscheme everforest

" NERD Tree ----
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-o> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * lcd %:p:h
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
autocmd BufEnter * if exists("g:NERDTree") && g:NERDTree.IsOpen() | silent execute 'NERDTreeFind' | endif
let NERDTreeShowHidden=1
let g:NERDTreeFileLines = 1
" ---

" FZF ---
nnoremap <C-p> :Files<CR>

let g:fzf_action = {
  \ 'enter': 'tab drop',
  \ 'ctrl-t': 'tabnew',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" ---

