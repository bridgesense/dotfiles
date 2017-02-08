" Don't try to be vi compatible
set nocompatible


" Helps force plugins to load correctly when it is turned back on below
filetype off

execute pathogen#infect()


" Turn on syntax highlighting
syntax on


" For plugins to load correctly
filetype plugin indent on


" Pick a leader key
let mapleader = ","


" Security
set modelines=0


" Show line numbers
set number


" Line Numbering
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


" Show file stats
set ruler


" Blink cursor on error instead of beeping (grr)
set visualbell


" Encoding
set encoding=utf-8


" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
"map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>ln :set list!<CR> " Toggle tabs and EOL

let vimsettings = '~/.dotsense/vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
