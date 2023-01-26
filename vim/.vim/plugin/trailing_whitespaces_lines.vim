" Automatically deletes all trailing whitespaces and newlines at end of file
" on save, then reset cursor position
augroup trailing_whitespaces_newlines
    autocmd!
    autocmd BufWritePre * let currPos = getpos(".")
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre *.[ch] %s/\%$/\r/e
    autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
augroup END
