" Appearance
colorscheme habamax
set guioptions=""

" Font Config
let s:defaultFontSize = 12
let s:fontFamily = "Cascadia Code"
let s:fontSize = s:defaultFontSize
let s:fontSizeLowerLimit = 8
let s:fontSizeUpperLimit = 72
let s:fontStep = 2
let &guifont = s:fontFamily . ":" . "h" . s:fontSize . ":b"

" Set font size to a:size
" Note: font size will be aligned by s:fontStep, but to its upper one.
"       i.e., a:size is 12 and s:fontStep is 2, new font size will be 12.
"             a:size is 13 and s:fontStep is 2, new font size will be 14.
function SetFontSize(size)
    let step = (a:size + s:fontStep - 1) / s:fontStep
    let newSize = s:fontStep * step
    let newSize = min([newSize, s:fontSizeUpperLimit])
    let newSize = max([newSize, s:fontSizeLowerLimit])
    let s:fontSize = newSize
    let &guifont = s:fontFamily . ":" . "h" . s:fontSize
endfunction

" Adjust font size by step not size.
function AdjustFontSize(step)
    call SetFontSize(s:fontSize + s:fontStep * a:step)
endfunction

function ResetFontSize()
    call SetFontSize(s:defaultFontSize)
endfunction

" Key Bindings
nnoremap <silent> <Leader>q <Cmd>call AdjustFontSize(+v:count1)<CR>
nnoremap <silent> <Leader>w <Cmd>call AdjustFontSize(-v:count1)<CR>
nnoremap <silent> <Leader>e <Cmd>call ResetFontSize()<CR>
