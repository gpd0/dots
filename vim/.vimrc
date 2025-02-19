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
nnoremap <C-t> :NERDTreeToggle<CR>:call SyncTree()<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * if argc() == 0 | endif
autocmd VimEnter * if argc() > 0 | NERDTreeVCS | wincmd p | endif

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd BufEnter * if &filetype != 'startify' && exists('t:startify') | NERDTree | wincmd p | NERDTreeFind | wincmd p | unlet t:startify | endif

autocmd User Startified let t:startify = 1

let NERDTreeShowHidden=1
let g:NERDTreeFileLines = 1
" ---

" FZF ---
nnoremap <C-p> :Files<CR>

let g:fzf_action = {
  \ 'enter': 'edit',
  \ 'ctrl-t': 'tabnew',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" ---

" Coc ---
nnoremap gd <Plug>(coc-definition)
nnoremap gr <Plug>(coc-references)
nnoremap K :call CocActionAsync('doHover')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
" ---

if has("termguicolors")
  set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline = 0

set t_RV=

" Startify ---
let g:ascii = [
      \ ' /$$$$$$$$ /$$                   /$$   /$$              /$$$$$$ /$$           /$$    /$$ /$$$$$$ /$$      /$$',
      \ '|__  $$__/| $$                  | $$  | $/             |_  $$_/| $$          | $$   | $$|_  $$_/| $$$    /$$$',
      \ '   | $$   | $$$$$$$   /$$$$$$  /$$$$$$|_//$$$$$$$        | $$ /$$$$$$        | $$   | $$  | $$  | $$$$  /$$$$',
      \ '   | $$   | $$__  $$ |____  $$|_  $$_/  /$$_____/        | $$|_  $$_/        |  $$ / $$/  | $$  | $$ $$/$$ $$',
      \ '   | $$   | $$  \ $$  /$$$$$$$  | $$   |  $$$$$$         | $$  | $$           \  $$ $$/   | $$  | $$  $$$| $$',
      \ '   | $$   | $$  | $$ /$$__  $$  | $$ /$$\____  $$        | $$  | $$ /$$        \  $$$/    | $$  | $$\  $ | $$',
      \ '   | $$   | $$  | $$|  $$$$$$$  |  $$$$//$$$$$$$/       /$$$$$$|  $$$$/         \  $/    /$$$$$$| $$ \/  | $$',
      \ '   |__/   |__/  |__/ \_______/   \___/ |_______/       |______/ \___/            \_/    |______/|__/     |__/',
      \ '                                                                                                             ',
      \ '                                                                                                             ',
      \ '                                                                                                             ',
      \]

let g:startify_custom_header = g:ascii
let g:startify_custom_footer = [
      \ 'Tip: Press [CTRL] + P for quick file explorer!',
      \ 'Tip: Use :PlugInstall to install all plugins.',
      \ 'Tip: Use [CTRL] + T to toggle NERD Tree!',
      \ ]

" ---

