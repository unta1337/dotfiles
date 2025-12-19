" Appearance
colorscheme habamax
set guioptions=""

" Screen Dimension
set lines=32
set columns=120

" Font Config
let s:defaultFontSize = 12
let s:fontFamily = "Cascadia_Code_SemiBold"
let s:fontSize = s:defaultFontSize
let s:fontSizeLowerLimit = 8
let s:fontSizeUpperLimit = 36
let &guifont = s:fontFamily . ":" . "h" . s:fontSize

function IncFontSize()
    let s:fontSize = min([s:fontSize + 2, s:fontSizeUpperLimit])
    let &guifont = s:fontFamily . ":" . "h" . s:fontSize
endfunction

function DecFontSize()
    let s:fontSize = max([s:fontSize - 2, s:fontSizeLowerLimit])
    let &guifont = s:fontFamily . ":" . "h" . s:fontSize
endfunction

function ResetFontSize()
    let s:fontSize = s:defaultFontSize
    let &guifont = s:fontFamily . ":" . "h" . s:fontSize
endfunction

" Key Bindings
nnoremap <Leader>q :call IncFontSize()<CR>
nnoremap <Leader>w :call DecFontSize()<CR>
nnoremap <Leader>e :call ResetFontSize()<CR>
