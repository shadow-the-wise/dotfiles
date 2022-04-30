" Make any file with the ending *.md recognised as markdown.
au! BufRead,BufNewFile *.md setfiletype markdown

" Format all words in a paragraph. A new sentence requires one space. Same as gq}
au! Filetype markdown setl formatoptions+=tan
