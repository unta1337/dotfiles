" Default Configurations
let g:defaultFontSize = 12
let g:defaultFontStep = 4
let g:fontSizeLowerLimit = g:defaultFontSize
let g:fontSizeUpperLimit = 40

" Variables
let g:fontFamily = "Semteulche Medium Semi-condensed"
let g:fontSize = g:defaultFontSize

" Functions
function FitToScreen()
    let &lines = 999999
    let &columns = 999999
endfunction

function GetGuiFont()
    return g:fontFamily . " " . g:fontSize
endfunction

function UpdateGuiFont()
    let &guifont = GetGuiFont()
    call FitToScreen()
endfunction

function SetFontSize(size)
    if g:fontSizeLowerLimit <= a:size && a:size <= g:fontSizeUpperLimit
        let g:fontSize = a:size
        call UpdateGuiFont()
    endif
endfunction

function ModFontSize(amount)
    let newFontSize = g:fontSize + a:amount

    if g:fontSizeLowerLimit <= newFontSize && newFontSize <= g:fontSizeUpperLimit
        let g:fontSize = newFontSize
        call UpdateGuiFont()
    endif
endfunction

" Keymaps
nnoremap  :call ModFontSize(-g:defaultFontStep)<CR>
nnoremap <C-=> :call ModFontSize(g:defaultFontStep)<CR>
nnoremap <C-0> :call SetFontSize(g:defaultFontSize)<CR>

" Apply configs
let &guioptions = substitute(&guioptions, 'T', '', 'g')
let &guioptions = substitute(&guioptions, 'm', '', 'g')
let &guioptions = substitute(&guioptions, '[rlRL]', '', 'g')

UpdateGuiFont()
