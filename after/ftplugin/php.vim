" Someoddpilot coding standards prefers indenting by 2 spaces
" See
" https://github.com/SomeoddpilotInc/Someoddpilot-Coding-Style/blob/master/php.md
setlocal shiftwidth=2
setlocal tabstop=2

" Highlight trailing whitespace
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
