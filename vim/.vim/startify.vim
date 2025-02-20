let g:startify_custom_footer = [                                                                                                                                                          
      \ 'Tip: Press [CTRL] + P for quick file explorer!',                                                                                                                                 
      \ 'Tip: Use :PlugInstall to install all plugins.',                                                                                                                                  
      \ 'Tip: Use [CTRL] + T to toggle NERD Tree!',                                                                                                                                       
      \ ]                                                                                                                                                                                 
                                                                                                                                                                                          
let g:startify_enable_special = 1                                                                                              
let g:startify_files_number = 7
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [                                                                                                                                                                  
      \ { 'type': 'files',  'header': ['   Most Recently Used Files'] },                                                                                                                  
      \ { 'type': 'dir',    'header': ['   Recent Directories'] },                                                                                                                        
      \ { 'type': 'sessions', 'header': ['   Sessions'] },                                                                                                                                
      \ { 'type': 'commands', 'header': ['   Open Folder'], 'commands': ['NERDTreeToggle'] },                                                                                             
      \ { 'type': 'commands', 'header': ['   Open File'], 'commands': ['FzfFiles'] }                                                                                                      
      \ ]                         

let g:startify_custom_header =
            \ 'startify#center(startify#fortune#cowsay())'
