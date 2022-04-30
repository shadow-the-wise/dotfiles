"------------------------------------------------------------------------------
" Fold
"------------------------------------------------------------------------------
hi Folded cterm=NONE term=NONE ctermfg=12 ctermbg=8 guifg=Cyan guibg=DarkGrey

" Set the fold colmn color for unfolds
hi FoldColumn ctermfg=1 ctermbg=0 gui=bold guifg=Blue guibg=DarkCyan

"------------------------------------------------------------------------------
" Completion
"------------------------------------------------------------------------------
" Completion Colorscheme
hi Pmenu           term=reverse cterm=reverse ctermfg=0 ctermbg=10 guibg=Magenta
hi PmenuSel        term=reverse cterm=reverse ctermfg=4 ctermbg=7 guibg=DarkGrey
hi PmenuSbar       term=reverse cterm=reverse ctermfg=7 ctermbg=12 guibg=Grey
hi PmenuThumb      term=reverse cterm=reverse ctermfg=10 ctermbg=0 guibg=White

"------------------------------------------------------------------------------
" Git Gutter
"------------------------------------------------------------------------------
highlight GitGutterAdd    ctermfg=28
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

"------------------------------------------------------------------------------
" Telescope color
"------------------------------------------------------------------------------
highlight TelescopeBorder ctermfg=4 ctermbg=0

" Highlight characters your input matches
" highlight TelescopeMatching       guifg=blue

" Color the prompt prefix
" highlight TelescopePromptPrefix   guifg=red

"------------------------------------------------------------------------------
" Hop
"------------------------------------------------------------------------------
hi HopNextKey1  ctermfg=196
hi HopNextKey2  ctermfg=196
hi HopNextKey   ctermfg=196
