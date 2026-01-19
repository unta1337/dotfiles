if exists("g:source_compilation_init")
    finish
endif
let g:source_compilation_init = v:true

source $HOME/.config/vim/scripts/compilation_mode/c.vim
source $HOME/.config/vim/scripts/compilation_mode/cpp.vim
source $HOME/.config/vim/scripts/compilation_mode/ruby.vim
source $HOME/.config/vim/scripts/utils/loc_utils.vim

let s:RunProgramTable = {
\                           "c": function("RunCProgram"),
\                           "cpp": function("RunCPPProgram"),
\                           "ruby": function("RunRubyProgram"),
\                       }

function RunProgram()
    call s:RunProgramTable[&filetype]()
endfunction

" Note: Location must be like:
"       <file_name>:<row>:col:
"       or
"       <file_name>(<row>,col)
function OpenErrorLoc()
    let line = getline(".")
    let error_loc = GetLoc(line)

    if error_loc isnot v:null
        execute $"tabnew {error_loc[0]}"
        execute $"normal! {error_loc[1]}G"
        execute $"normal! 0"
        execute $"normal! {error_loc[2]}|"
    endif
endfunction

nnoremap <Leader>x :call RunProgram()<CR>

nnoremap <Leader>f :call OpenErrorLoc()<CR>
