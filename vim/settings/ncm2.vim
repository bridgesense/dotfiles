" enable ncm2 for all buffers
autocmd BufEnter * :silent! call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

"path to the libclang.so file
let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so.11' 
