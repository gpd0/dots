nnoremap <leader>n :NERDTreeFocus<CR>                                                                                                                                                     
nnoremap <C-o> :execute (&filetype != 'startify' ? 'NERDTree' : 'echo "NERDTree disabled on Startify"')<CR>                                                                               
nnoremap <C-t> :if &filetype != 'startify' \| NERDTreeToggle \| else \| echo "NERDTree disabled on Startify" \| endif<CR>                                                                 
nnoremap <C-f> :NERDTreeFind<CR>                                                                                                                                                          
                                                                                                                                                                                          
autocmd VimEnter * if !argc() | NERDTree | wincmd p | endif                                                                                                                               
                                                                                                                                                                                          
let g:NERDTreeHijackNetrw = 0                                                                                                                                                             
let NERDTreeShowHidden=1                                                                                                                                                                  
let g:NERDTreeFileLines = 1                                                                                                                                                               
let g:NERDTreeQuitOnOpen = 1  
