" ========================================
" Linux specific General vim sanity improvements
" ========================================
"
" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Now using the middle finger of either hand you can type
" underscores with Alt-k or Alt-d, and add Shift
" to type dashes
" imap <silent> <M-k> _
" imap <silent> <M-d> _
" imap <silent> <M-K> -
" imap <silent> <M-D> -

" Change inside various enclosures with Alt-" and Alt-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
" nnoremap <M-'> f'ci'
" nnoremap <M-"> f"ci"
" nnoremap <M-(> f(ci(
" nnoremap <M-)> f)ci)
" nnoremap <M-[> f[ci[
" nnoremap <M-]> f]ci]

" ==== NERD tree
" Alt-Shift-N for nerd tree
nmap <M-N> :NERDTreeToggle<CR>

" move up/down quickly by using Alt-j, Alt-k
" which will move us around by functions
nnoremap <silent> <M-j> }
nnoremap <silent> <M-k> {
autocmd FileType ruby map <buffer> <M-j> ]m
autocmd FileType ruby map <buffer> <M-k> [m
autocmd FileType rspec map <buffer> <M-j> }
autocmd FileType rspec map <buffer> <M-k> {
autocmd FileType javascript map <buffer> <M-k> }
autocmd FileType javascript map <buffer> <M-j> {

" Command-/ to toggle comments
" map <M-/> :TComment<CR>
" imap <M-/> <Esc>:TComment<CR>i

" Use Alt- numbers to pick the tab you want
nmap <silent> <M-1> :tabn 1<cr>
nmap <silent> <M-2> :tabn 2<cr>
nmap <silent> <M-3> :tabn 3<cr>
nmap <silent> <M-4> :tabn 4<cr>
nmap <silent> <M-5> :tabn 5<cr>
nmap <silent> <M-6> :tabn 6<cr>
nmap <silent> <M-7> :tabn 7<cr>
nmap <silent> <M-8> :tabn 8<cr>
nmap <silent> <M-9> :tabn 9<cr>

" Tab Controls
nmap <silent> <M-c> :tabnew<cr>
nmap <silent> <M-q> :tabc!<cr>
nmap <silent> <M-z> :tabp<cr>
nmap <silent> <M-x> :tabN<cr>

" Resize windows with arrow keys
nnoremap <M-Up> <C-w>+
nnoremap <M-Down> <C-w>-
nnoremap <M-Left> <C-w><
nnoremap <M-Right>  <C-w>>

" ============================
" Tabularize - alignment
" ============================
" Hit Alt-Shift-A then type a character you want to align by
nmap <M-A> :Tabularize /
" vmap <M-A> :Tabularize /

" Source current file Alt-% (good for vim development)
nmap <M-%> :so %<CR>

" Uncomment the following to fix URXVT Alt key issue
if g:urxvt_fix
    for i in range(65,90) + range(97,103) + range(108,122)
      let c = nr2char(i)
      exec "nmap \e".c." <M-".c.">"
    endfor
endif 
