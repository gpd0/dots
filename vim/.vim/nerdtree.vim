" Key Maps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Vars
let g:NERDTreeHijackNetrw=0 
let NERDTreeShowHidden=1
let g:NERDTreeFileLines=1
let g:NERDTreeQuitOnOpen=1 

" Commands

" Start NERDTree only if a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() > 0 | NERDTree | wincmd p | NERDTreeFind | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Create a function to ensure we're not in NERDTree before running non-NERDTree commands
    function! EnsureNotInNERDTreeForExternalCommands()
        if exists('b:NERDTree') && b:NERDTree.isTabTree()
          " List of NERDTree's own commands that should be allowed to run in NERDTree window
          let l:nerdtree_commands = [
                \ 'NERDTree', 'NERDTreeCWD', 'NERDTreeClose', 'NERDTreeFind',
                \ 'NERDTreeFocus', 'NERDTreeFromBookmark', 'NERDTreeMirror',
                \ 'NERDTreeRefreshRoot', 'NERDTreeToggle', 'NERDTreeVCS'
                \ ]
          
          " Get the command being run
          let l:cmd = getcmdline()
          " Skip if command line is empty
          if empty(l:cmd)
            return
          endif
          
          let l:cmd_parts = split(l:cmd, '\s\+')
          " Skip if parts array is empty
          if empty(l:cmd_parts)
            return
          endif
          
          let l:base_cmd = l:cmd_parts[0]
          
          " If it starts with a NERDTree command, allow it
          let l:is_nerdtree_cmd = 0
          for cmd in l:nerdtree_commands
            if l:base_cmd =~ '^' . cmd
              let l:is_nerdtree_cmd = 1
              break
            endif
          endfor
          
          " If it's not a NERDTree command, move to another window
          if !l:is_nerdtree_cmd
            let l:current = winnr()
            wincmd p
            if exists('b:NERDTree') && b:NERDTree.isTabTree()
              wincmd w
            endif
            if exists('b:NERDTree') && b:NERDTree.isTabTree()
              wincmd v
              wincmd l
            endif
          endif
        endif
      endfunction
      
      augroup NERDTreeCommandFix
        autocmd!
        autocmd CmdlineEnter * if getcmdtype() == ':' | call EnsureNotInNERDTreeForExternalCommands() | endif
      augroup END