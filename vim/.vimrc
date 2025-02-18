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
nnoremap <C-t> :call ToggleTree()<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  else
    NERDTree
  endif
endfunction

autocmd BufEnter * call SyncTree()
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
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

if has("termguicolors")
  set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline = 0

set t_RV=
