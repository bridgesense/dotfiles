" These keys are easier to type than the default set
" We exclude semicolon because it's hard to read and
" i and l are too easy to mistake for each other slowing
" down recognition. The home keys and the immediate keys
" accessible by middle fingers are available 
let g:EasyMotion_keys='asdfjkoweriop'
nmap ,<ESC> ,,w
nmap ,<S-ESC> ,,b

" <Leader>f{char} to move to {char}
map  <Leader>j <Plug>(easymotion-bd-f)
nmap <Leader>j <Plug>(easymotion-overwin-f)
