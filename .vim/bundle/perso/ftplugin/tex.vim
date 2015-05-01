setlocal tw=80
function! CompileTarget(file)
    if exists("g:target")
        exec "!pdflatex ".g:target
    else
        exec "!pdflatex ".a:file
    endif
endfunction

function! ChooseTarget(file)
    let g:target = a:file
endfunction

function! DisplayTarget(file)
    if exists("g:target")
        exec "!evince $(basename ".g:target." .tex).pdf&"
    else
        exec "!evince $(basename ".a:file." .tex).pdf&"
    endif
endfunction

function! MakeGlossaries(file)
    if exists("g:target")
        exec "!makeglossaries $(basename ".g:target." .tex)"
    else
        exec "!makeglossaries $(basename ".a:file." .tex)"
    endif
endfunction

function! MakeBiblio(file)
    if exists("g:target")
        exec "!bibtex $(basename ".g:target." .tex)"
    else
        exec "!bibtex $(basename ".a:file." .tex)"
    endif
endfunction

nnoremap <F5> : call ChooseTarget(expand('%'))<CR>
nnoremap <F6> : call CompileTarget(expand('%'))<CR>
nnoremap <F7> : call DisplayTarget(expand('%'))<Cr>
"nnoremap <F7> :! evince $(basename  % .tex).pdf&<cr><CR>
"nnoremap <F8> :!bibtex $(basename  % .tex)<CR>
nnoremap <F8> : call MakeBiblio(expand('%'))<CR>
nnoremap <F9> : call MakeGlossaries(expand('%'))<CR>

