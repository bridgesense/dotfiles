" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set backspace=indent,eol,start  "Allow backspace in insert mode
" :fixdel                         "Fixes Remote Issues with Del key
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set noerrorbells                "No sounds or flashing
set visualbell
set t_vb=
set autoread                    "Reload files changed outside vim
set path+=**
set updatetime=1000

" Prevent vim-session from asking us to load the session.
" If you want to load the session, use :SaveSession and :OpenSession
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Create the 'tags' file (dep: ctags)
if filereadable("/etc/redhat-release")
    let g:maketags_arg = "ag -l | exctags -f tags --exclude={*.css,*.js} --links=no -L-"
else
    let g:maketags_arg = "ag -l | ctags -f tags --exclude={*.css,*.js} --links=no -L-"
endif
command! MakeTags execute ' !' . g:maketags_arg

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on
"bash friendly highlighting
if has("autocmd")
  augroup bashalias
    autocmd BufRead,BufNewFile .bash_aliases set filetype=bash
  augroup END
endif

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
filetype off
execute pathogen#infect()
filetype plugin indent on

" ================ vimrc.after ================
" This loads user definable changes
if filereadable(expand("~/.vimrc.after"))
    source ~/.vimrc.after
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

"set foldmethod=indent   "fold based on indent
"set foldnestmax=3       "deepest fold is 3 levels
"set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
let vimsettings = '~/.yadrlite/vim/settings'
let uname = substitute(system('uname'), '\n', '', '')

if uname == "Linux" && !has("gui_running")
   let g:patched_fonts = 1
else
   let g:patched_fonts = 0
endif

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname == "Linux"     
    continue " skiped mac mappings
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname != "Linux" 
    continue " skiped linux mappings
  endif

  exe 'source' fpath
endfor
