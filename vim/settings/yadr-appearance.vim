" Make it beautiful - colors and fonts

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  end
else
  let g:CSApprox_loaded = 1
endif

" Light/Dark Theme Switch
let g:gruvboxtheme="dark"
let g:gruvbox_termcolors=256
function! ToggleGruvbox()
    if g:gruvboxtheme == "light" 
        let g:gruvboxtheme="dark"
        set background=dark
    else
        let g:gruvboxtheme="light"
        set background=light
    endif

endfunction
nnoremap <silent> ,Ot :call ToggleGruvbox()<CR>
colorscheme gruvbox
set background=dark
" transparence fix
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

