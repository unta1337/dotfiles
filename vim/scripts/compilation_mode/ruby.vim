if exists("g:source_compilation_ruby")
    finish
endif
let g:source_compilation_ruby = v:true

source $HOME/.config/vim/scripts/utils/term_utils.vim

let s:rb = "ruby"

function s:RunRuby()
    let curr_file_path = expand("%:p")

    let cmd = $"{s:rb} {curr_file_path}"

    call ExecuteShellCommand(cmd)
endfunction

function RunRubyProgram()
    call s:RunRuby()
endfunction
