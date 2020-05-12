set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" remember last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
