" Settings for Python

" Four spaces for indentation
set autoindent
set nosmartindent
set ts=4
set sw=4
set et

" Autoindent after certain keywords
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
match BadWhitespace /^\s*\t\+/
" Make trailing whitespace be flagged as bad.
2match BadWhitespace /\s\+$/
