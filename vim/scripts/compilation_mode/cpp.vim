if exists("g:source_compilation_cpp")
    finish
endif
let g:source_compilation_cpp = v:true

source $HOME/.config/vim/scripts/utils/term_utils.vim

let s:cpp = g:compilation_cpp
if s:cpp ==# "cl"
    let s:cppflags = "/EHsc /std:c++17 /F1024000000 /diagnostics:caret"
elseif s:cpp ==# "clang"
    let s:cppflags = "-std=c++17"
endif

function s:RunMSVC()
    let curr_file_name = expand("%:t")
    let curr_file_path = expand("%:p")
    let obj_file_path = tempname() . "_" . curr_file_name . ".obj"
    let exe_file_path = tempname() . "_" . curr_file_name . ".exe"

    let compile_cmd = $"{s:cpp} {s:cppflags} {curr_file_path} /Fo{obj_file_path} /Fe{exe_file_path}"
    let run_cmd = $"{exe_file_path}"

    let cmd = $"{compile_cmd} && {run_cmd}"

    call ExecuteShellCommand(cmd)
endfunction

function s:RunClang()
    let curr_file_name = expand("%:t")
    let curr_file_path = expand("%:p")
    let exe_file_path = tempname() . "_" . curr_file_name . ".exe"

    let compile_cmd = $"{s:cpp} {s:cppflags} {curr_file_path} -o {exe_file_path}"
    let run_cmd = $"{exe_file_path}"

    let cmd = $"{compile_cmd} && {run_cmd}"

    call ExecuteShellCommand(cmd)
endfunction

function RunCPPProgram()
    if s:cpp ==# "cl"
        call s:RunMSVC()
    elseif s:cpp ==# "clang"
        call s:RunClang()
    endif
endfunction
