" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = g:maketags_arg

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Ag command
nmap <leader>ag :Ag<cr> 
nmap <leader>aw :Ag <C-r><C-w><cr>
nmap <leader>af :Files<cr>
nmap <expr> <leader>ad ":Ag<cr>" . expand("%:h") . " "
" Easy command lookup and execute
nmap ,,c :Commands<cr>

" Buffer lookup
nmap ,b :Buffers<cr>

" View file history 
nmap ,,b :History<cr>

" Commit History
nmap ,h :BCommits<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" FZFTags 
" override the default jump-to-tag binding 
nmap <C-]> <Plug>(fzf_tags)
nmap ,gt :FZFTags <C-r><C-w><CR>
nmap ,gi :tag<CR>
nmap ,go :pop<CR>
