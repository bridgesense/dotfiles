" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'bridgesense/vim-bufsurf'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
Plug 'andymass/vim-matchup'
Plug 'vim-scripts/MultipleSearch'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-vdebug/vdebug'
Plug 'bridgesense/vim-hsftp'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'morhetz/gruvbox'
Plug 'gorodinskiy/vim-coloresque'
Plug 'vim-scripts/YankRing.vim'
Plug 'kchmck/vim-coffee-script'
if has('nvim-0.3.2')
    Plug 'neoclide/coc.nvim', {'branch': 'release' }
endif

" Initialize plugin system
call plug#end()

" Install missing plugins on Vim startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
