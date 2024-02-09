source $HOME/.vim/scripts/PaperColor.vim

let g:defaultFontSize = 12
let g:defaultFontStep = 4
let g:fontSizeLowerLimit = g:defaultFontSize
let g:fontSizeUpperLimit = 40

let g:fontFamily = "Semteulche Medium Semi-condensed"
let g:fontSize = g:defaultFontSize

let &guifont = g:fontFamily . " " . g:fontSize
let &guioptions = substitute(&guioptions, 'T', '', 'g')
let &guioptions = substitute(&guioptions, 'm', '', 'g')
let &guioptions = substitute(&guioptions, '[rlRL]', '', 'g')

function SetFontSize(size)
    if g:fontSizeLowerLimit <= a:size && a:size <= g:fontSizeUpperLimit
        let g:fontSize = a:size
        let &guifont = g:fontFamily . " " . g:fontSize
    endif
endfunction

function ModFontSize(amount)
    let newFontSize = g:fontSize + a:amount

    if g:fontSizeLowerLimit <= newFontSize && newFontSize <= g:fontSizeUpperLimit
        let g:fontSize = newFontSize
        let &guifont = g:fontFamily . " " . g:fontSize
    endif
endfunction

nnoremap  :call ModFontSize(-g:defaultFontStep)<CR>
nnoremap <C-=> :call ModFontSize(g:defaultFontStep)<CR>
nnoremap <C-0> :call SetFontSize(g:defaultFontSize)<CR>
