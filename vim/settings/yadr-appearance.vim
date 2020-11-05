" Make it beautiful - colors and fonts

"tell the term has 256 colors
if (has("termguicolors") && $COLORTERM !~ "rxvt")
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has("gui_running")
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
  endif
else
  let g:CSApprox_loaded = 1
endif

" Light/Dark Theme Switch
let g:gruvboxtheme="dark"
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_contrast_light="medium"
let g:gruvbox_invert_selection=0
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

set t_Co=256
colorscheme gruvbox
set background=dark

" uncomment for transparent background
let t:is_transparent = 1                                                                    
hi! Normal ctermbg=none guibg=NONE
hi! NonText ctermbg=none guibg=NONE

" prettier EasyMotion
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=gray

hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

hi EasyMotionMoveHL ctermbg=none ctermfg=black
hi EasyMotionIncSearch ctermbg=none ctermfg=black
