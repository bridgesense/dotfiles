" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-php-manual'
Plug 'andymass/vim-matchup'
Plug 'bridgesense/vim-bufsurf'
Plug 'bridgesense/vim-hsftp'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'gorodinskiy/vim-coloresque'
Plug 'honza/vim-snippets'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/MultipleSearch'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-vdebug/vdebug'
Plug 'zackhsi/fzf-tags'
if has('nvim-0.3.2')
    Plug 'kchmck/vim-coffee-script'
    Plug 'neoclide/coc.nvim', {'branch': 'release' }
else
    Plug 'PhilRunninger/nerdtree-visual-selection'
    Plug 'preservim/nerdtree'
    Plug 'vim-syntastic/syntastic'
endif

" Initialize plugin system
call plug#end()

" Install missing plugins on Vim startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
