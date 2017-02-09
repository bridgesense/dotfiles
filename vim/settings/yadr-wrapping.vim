" http://vimcasts.org/episodes/soft-wrapping-text/
function! SetupWrapping()
    set wrap linebreak nolist
    set showbreak=…
endfunction

function! StopWrapping()
    set nowrap
endfunction

" TODO: this should happen automatically for certain file types (e.g. markdown)
command! -nargs=* Wrap :call SetupWrapping()<CR>
command! -nargs=* Nowrap :call StopWrapping()<CR>

vmap <D-j> gj
vmap <D-k> gk
vmap <D-$> g$
vmap <D-^> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-$> g$
nmap <D-^> g^
nmap <D-0> g^
