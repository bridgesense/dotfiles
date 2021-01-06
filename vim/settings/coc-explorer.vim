if has('nvim')
    
    " Use preset argument to open it
    nmap <silent> <leader>n :CocCommand explorer
    \ --toggle
    \ --open-action-strategy sourceWindow
    \ --quit-on-open
    \ --sources=buffer+,file+<CR>

    nmap <silent> <leader>m :CocCommand explorer
    \ --toggle
    \ --open-action-strategy sourceWindow
    \ --quit-on-open
    \ --sources=buffer+,file+
    \ ./<CR>

endif
