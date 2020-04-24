function! GetVisual()
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction

"grep the current word using <leader> (mnemonic Kurrent)
nnoremap <silent> <leader> :Ag <cword><CR>

"grep visual selection
vnoremap <leader> :<C-U>execute "Ag " . GetVisual()<CR>

"grep current word up to the next exclamation point using <leader>
nnoremap <leader> viwf!:<C-U>execute "Ag " . GetVisual()<CR>

"grep for 'def foo'
nnoremap <silent> <leader>d :Ag 'def <cword>'<CR>

"<leader>g = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap <leader>g :Ag ""<left>

"Grep for usages of the current file
nnoremap <leader>cf :exec "Ag " . expand("%:t:r")<CR>
