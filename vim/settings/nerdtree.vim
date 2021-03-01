" if ! has('nvim-0.3.2')
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let g:NERDTreeWinSize = 30
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen = 3
    map <leader>n :NERDTreeToggle<CR>
    map <leader>m :NERDTreeFind<CR>
" endif
