" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Gruvbox colorscheme for Lightline (itchyny/lightline.vim)
" Author: gmoe <me@griffinmoe.com>
" Last Author: Pablo Bender <pablo@bender.eti.br>
" Source: https://github.com/pablobender/lightline-gruvbox.vim
" Last Modified: 28 Sep 2019
" -----------------------------------------------------------------------------

function! s:getGruvColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui") 
  let termColor = synIDattr(hlID(a:group), "fg", "cterm") 
  return [ guiColor, termColor ]
endfunction

if exists('g:lightline')

  let s:bg0  = s:getGruvColor('GruvboxBg0')
  let s:bg1  = s:getGruvColor('GruvboxBg1')
  let s:bg2  = s:getGruvColor('GruvboxBg2')
  let s:bg3  = s:getGruvColor('GruvboxBg3')
  let s:bg4  = s:getGruvColor('GruvboxBg4')

  let s:gray = s:getGruvColor('GruvboxGray')

  let s:fg0  = s:getGruvColor('GruvboxFg0')
  let s:fg1  = s:getGruvColor('GruvboxFg1')
  let s:fg2  = s:getGruvColor('GruvboxFg2')
  let s:fg3  = s:getGruvColor('GruvboxFg3')
  let s:fg4  = s:getGruvColor('GruvboxFg4')

  let s:red    = s:getGruvColor('GruvboxRed')
  let s:green  = s:getGruvColor('GruvboxGreen')
  let s:yellow = s:getGruvColor('GruvboxYellow')
  let s:blue   = s:getGruvColor('GruvboxBlue')
  let s:purple = s:getGruvColor('GruvboxPurple')
  let s:aqua   = s:getGruvColor('GruvboxAqua')
  let s:orange = s:getGruvColor('GruvboxOrange')

  let s:neutral_red    = ['#cc241d', 124]
  let s:neutral_green  = ['#98971a', 106]
  let s:neutral_yellow = ['#d79921', 172]
  let s:neutral_blue   = ['#458588', 66]
  let s:neutral_purple = ['#b16286', 132]
  let s:neutral_aqua   = ['#689d6a', 72]
  let s:neutral_orange = ['#d65d0e', 166]

  let s:middle = [ s:gray, s:bg1 ]

  let s:inactive = s:bg2
  let s:inactive_bright = s:bg3
  let s:inactive_fg = s:fg4

  let s:normal = s:fg3
  let s:normal_bright = s:fg1

  let s:insert = s:neutral_blue
  let s:insert_bright = s:blue

  let s:replace = s:neutral_aqua
  let s:replace_bright = s:aqua

  let s:visual = s:neutral_orange
  let s:visual_bright = s:orange

  let s:terminal = s:neutral_green
  let s:terminal_bright = s:green

  let s:command = s:neutral_purple
  let s:command_bright = s:purple

  let s:inner_bg = s:bg2

  let s:p = {
        \ 'normal':{},
        \ 'inactive':{},
        \ 'insert':{},
        \ 'replace':{},
        \ 'visual':{},
        \ 'tabline':{},
        \ 'terminal':{},
        \ 'command':{}
        \ }

  let s:p.inactive.right  = [ [ s:inactive_fg, s:inactive ], [ s:inactive_fg, s:inactive_bright ], [ s:inactive_fg, s:bg3 ] ]
  let s:p.inactive.left   = [ [ s:inactive_fg, s:inactive ] ]
  let s:p.inactive.middle = [ s:middle  ]

  let s:p.normal.left   = [ [ s:bg0,  s:normal ], [ s:bg0, s:normal_bright ], [ s:normal_bright, s:inner_bg ] ]
  let s:p.normal.right  = [ [ s:bg0,  s:normal ], [ s:bg0, s:normal_bright ], [ s:normal_bright, s:inner_bg ] ]
  let s:p.normal.middle = [ s:middle  ]

  let s:p.insert.left   = [ [ s:bg0,  s:insert, 'bold'], [ s:bg0, s:insert_bright ], [ s:insert_bright, s:inner_bg ] ]
  let s:p.insert.right  = [ [ s:bg0,  s:insert ],        [ s:bg0, s:insert_bright ], [ s:insert_bright, s:inner_bg ] ]
  let s:p.insert.middle = [ s:middle ]

  let s:p.replace.left   = [ [ s:bg0,  s:replace, 'bold'], [ s:bg0, s:replace_bright ], [ s:replace_bright, s:inner_bg ] ]
  let s:p.replace.right  = [ [ s:bg0,  s:replace ],        [ s:bg0, s:replace_bright ], [ s:replace_bright, s:inner_bg ] ]
  let s:p.replace.middle = [ s:middle ]

  let s:p.visual.left   = [ [ s:bg0,  s:visual, 'bold'], [ s:bg0, s:visual_bright ], [ s:visual_bright, s:inner_bg ] ]
  let s:p.visual.right  = [ [ s:bg0,  s:visual ],        [ s:bg0, s:visual_bright ], [ s:visual_bright, s:inner_bg ] ]
  let s:p.visual.middle = [ s:middle ]

  let s:p.terminal.left   = [ [ s:bg0,  s:terminal, 'bold'], [ s:bg0, s:terminal_bright ], [ s:terminal_bright, s:inner_bg ] ]
  let s:p.terminal.right  = [ [ s:bg0,  s:terminal ],        [ s:bg0, s:terminal_bright ], [ s:terminal_bright, s:inner_bg ] ]
  let s:p.terminal.middle = [ s:middle ]

  let s:p.command.left   = [ [ s:bg0,  s:command, 'bold'], [ s:bg0, s:command_bright ], [ s:command_bright, s:inner_bg ] ]
  let s:p.command.right  = [ [ s:bg0,  s:command ],        [ s:bg0, s:command_bright ], [ s:command_bright, s:inner_bg ] ]
  let s:p.command.middle = [ s:middle ]

  let s:p.tabline.left = [ [ s:inactive_fg, s:inactive ] ]
  let s:p.tabline.tabsel = [ [ s:bg0, s:blue, 'bold' ] ]
  let s:p.tabline.middle = [ s:middle ]
  let s:p.tabline.right = [ [ s:bg0, s:bg4 ] ]

  let s:p.normal.error = [ [ s:bg0, s:orange ] ]
  let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]

  let g:lightline#colorscheme#gruvbox#palette = lightline#colorscheme#flatten(s:p)

  " to try recent saved cahgnes, uncomment lines below and `:w` then `:so %`
  " let g:lightline.colorscheme = 'gruvbox'
  " call lightline#init()
  " call lightline#colorscheme()
  " call lightline#update()

endif
