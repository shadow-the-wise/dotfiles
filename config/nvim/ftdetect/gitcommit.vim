" Set spell correction.
au! BufRead,BufNewFile gitcommit setl spell

au! Filetype *.gitcommit setl formatoptions+=tan
