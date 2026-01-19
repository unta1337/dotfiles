if exists("g:source_compilation_init")
    finish
endif
let g:source_compilation_init = v:true

source $HOME/.config/vim/scripts/compilation_mode/c.vim
source $HOME/.config/vim/scripts/compilation_mode/cpp.vim
source $HOME/.config/vim/scripts/utils/loc_utils.vim

function RunProgram()
    if &filetype ==# "c"
        call RunCProgram()
    elseif &filetype ==# "cpp"
        call RunCPPProgram()
    endif
endfunction

" Note: Location must be like:
"       <file_name>:<row>:col:
"       or
"       <file_name>(<row>,col)
function OpenErrorLoc()
    let line = getline(".")
    let error_loc = GetLoc(line)
    let error_file = error_loc[0]
    let error_row = error_loc[1]
    let error_col = error_loc[2]
    let file_ext = fnamemodify(error_file, ":e")

    execute $"tabnew {error_file}"
    execute $"normal! {error_row}gg"
    execute $"normal! 0"
    execute $"normal! {error_col}l"
endfunction

nnoremap <Leader>x :call RunProgram()<CR>

nnoremap <Leader>f :call OpenErrorLoc()<CR>
