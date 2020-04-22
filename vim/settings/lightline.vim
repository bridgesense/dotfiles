set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste'  ],
            \             [ 'fugitive', 'readonly', 'filename', 'modified'  ] ]
            \ 
            \},
            \ 'component_function': {
            \   'fugitive': 'MyFugitive',
            \   'readonly': 'MyReadonly',
            \   'filename': 'MyFilename',
            \ 
            \}
            \ 
            \}

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "X "
    else
        return ""
    endif
endfunction

function! MyFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '] '._ : ''
    endif
    return ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction
