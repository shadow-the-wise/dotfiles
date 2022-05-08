" Fold {{{1
"------------------------------------------------------------------------------
hi Folded cterm=NONE term=NONE ctermfg=12 ctermbg=8 guifg=Cyan guibg=DarkGrey

" Set the fold colmn color for unfolds
hi FoldColumn ctermfg=1 ctermbg=0 gui=bold guifg=Blue guibg=DarkCyan

" }}}
" Completion {{{1
"------------------------------------------------------------------------------
" Completion Colorscheme
hi Pmenu           term=reverse cterm=reverse ctermfg=0 ctermbg=10 guibg=Magenta
hi PmenuSel        term=reverse cterm=reverse ctermfg=4 ctermbg=7 guibg=DarkGrey
hi PmenuSbar       term=reverse cterm=reverse ctermfg=7 ctermbg=12 guibg=Grey
hi PmenuThumb      term=reverse cterm=reverse ctermfg=10 ctermbg=0 guibg=White

" }}}
" coc sign column {{{1
"------------------------------------------------------------------------------
" the color of the signs in the border alson linked to float

hi CocHintSign ctermbg=8 ctermfg=21
hi CocHintFloat ctermbg=8 ctermfg=21

hi CocInfoSign ctermbg=8 ctermfg=21
hi CocInfoFloat ctermbg=8 ctermfg=21

hi CocWarningSign ctermbg=8 ctermfg=202
hi CocWarningFloat ctermbg=8 ctermfg=202

" 160 bright red
hi CocErrorSign ctermbg=8 ctermfg=202
hi CocErrorFloat ctermbg=8 ctermfg=202

hi CocFloating ctermbg=8 ctermfg=11
" hi FgCocErrorFloatBgCocFloating ctermbg=8 ctermfg=9

" }}}
" Git Gutter {{{1
"------------------------------------------------------------------------------
highlight GitGutterAdd    ctermfg=28
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" }}}
" Telescope color {{{1
"------------------------------------------------------------------------------
highlight TelescopeBorder ctermfg=4 ctermbg=8

" Highlight characters your input matches
" highlight TelescopeMatching       guifg=blue

" Color the prompt prefix
" highlight TelescopePromptPrefix   guifg=red

" }}}
" Hop {{{1
"------------------------------------------------------------------------------
hi HopNextKey1  ctermfg=196
hi HopNextKey2  ctermfg=196
hi HopNextKey   ctermfg=196

" }}}
