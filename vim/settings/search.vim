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

"grep the current word using ,k (mnemonic Kurrent)
nnoremap <silent> ,k :Ack <cword><CR>

"grep visual selection
vnoremap ,k :<C-U>execute "Ack " . GetVisual()<CR>

"grep current word up to the next exclamation point using ,K
nnoremap ,K viwf!:<C-U>execute "Ack " . GetVisual()<CR>

"grep for 'class foo'
nnoremap <silent> ,gc :Ack 'class <cword>'<CR>

"grep for 'def foo'
nnoremap <silent> ,gd :Ack 'def <cword>'<CR>

"grep for 'function foo'
nnoremap <silent> ,gf :Ack 'function <cword>'<CR>

",gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap ,gg :Ack ""<left>

"Grep for usages of the current file
nnoremap ,gcf :exec "Ack " . expand("%:t:r")<CR>
