" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'etags.ctags -R'
" respect gitignore
let g:fzf_tags_command = 'ag -l | etags.ctags -L-'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Ag command
nmap <leader>ag :Ag  <left>
nmap <leader>af :Files<cr>

" Easy command lookup and execute
nmap ,,c :Commands<cr>

" Buffer lookup
nmap ,b :Buffers<cr>

" View file history 
nmap ,,b :History<cr>

" Commit History
nmap ,h :BCommits<cr>
