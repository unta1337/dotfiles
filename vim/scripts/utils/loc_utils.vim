if exists("g:source_loc_utils")
    finish
endif
let g:source_loc_utils = v:true

let s:locFileRowColRegex = "\\v^(\\s)@<!([^[:space:]].{-})[:\\(](\\d+)[:,](\\d+)[:\\)]"
let s:locFileRowRegex = "\\v^(\\s)@<!([^[:space:]].{-})[:\\(](\\d+)[:\\)]"

function GetLoc(line)
    let line_match = matchlist(a:line, s:locFileRowColRegex)
    if line_match == []
        let line_match = matchlist(a:line, s:locFileRowRegex)
    endif
    if line_match == []
        return v:null
    endif

    return [line_match[2], str2nr(line_match[3]), str2nr(line_match[4])]
endfunction

highlight LU_Highlight cterm=reverse gui=reverse

autocmd BufWinEnter * call matchadd("LU_Highlight", s:locFileRowColRegex)
autocmd BufWinEnter * call matchadd("LU_Highlight", s:locFileRowRegex)
