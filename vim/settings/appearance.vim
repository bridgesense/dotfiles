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
let g:CSApprox_loaded = 1

let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme solarized
set background=dark

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L

" Disable the macvim toolbar
set guioptions-=T
