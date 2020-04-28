" Move back and forth through previous and next buffers
" with ,z and ,x
let g:BufSurfIgnore = 'NERD,No Name,Debugger'
let g:BufSurfHistory = 25
nnoremap <silent> ,z :BufSurfBack<CR>
nnoremap <silent> ,x :BufSurfForward<CR>
nnoremap <silent> ,<TAB> :b#<CR>
