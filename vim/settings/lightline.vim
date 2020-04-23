" lightline config
set laststatus=2

" lightline for non-patched 
let g:lightline = {
		\ 'colorscheme': 'gruvbox',
		\ 'active': {
		\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
		\ },
		\ 'component_function': {
		\   'fugitive': 'LightlineFugitive',
		\   'filename': 'LightlineFilename'
		\ }
		\ }
function! LightlineModified()
    return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
    return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
    \ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft ==# 'unite' ? unite#get_status_string() :
    \  &ft ==# 'vimshell' ? vimshell#get_status_string() :
    \ expand('%') !=# '' ? expand('%') : '[No Name]') .
    \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction
function! LightlineFugitive()
    if &ft !~? 'vimfiler' && exists('*FugitiveHead')
        return FugitiveHead()
    endif
    return ''
endfunction
