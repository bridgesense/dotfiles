set number                      "Line numbers are good

function! ToggleNumber()
    if !&number && !&relativenumber
        set number
    elseif !&relativenumber
        set relativenumber
    else
        set nonumber
        set norelativenumber
    endif
endfunction

map <leader>l :call ToggleNumber()<cr>

