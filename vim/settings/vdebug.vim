" Look for .vimrc.local inside project 
" Settings file for vdebug
if filereadable('.vimrc.local') 
    source .vimrc.local 
endif
