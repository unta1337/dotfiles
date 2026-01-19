if exists("g:source_compilation_c")
    finish
endif
let g:source_compilation_c = v:true

source $HOME/.config/vim/scripts/compilation_mode/config.vim
source $HOME/.config/vim/scripts/utils/term_utils.vim

let s:cc = g:compilation_cc
if s:cc ==# "cl"
    let s:cflags = "/F1024000000 /diagnostics:caret"
elseif s:cc ==# "clang"
    let s:cflags = "-std=c99"
endif

function s:RunMSVC()
    let curr_file_name = expand("%:t")
    let curr_file_path = expand("%:p")
    let obj_file_path = tempname() . "_" . curr_file_name . ".obj"
    let exe_file_path = tempname() . "_" . curr_file_name . ".exe"

    let compile_cmd = $"{s:cc} {s:cflags} {curr_file_path} /Fo{obj_file_path} /Fe{exe_file_path}"
    let run_cmd = $"{exe_file_path}"

    let cmd = $"{compile_cmd} && {run_cmd}"

    call ExecuteShellCommand(cmd)
endfunction

function s:RunClang()
    let curr_file_name = expand("%:t")
    let curr_file_path = expand("%:p")
    let exe_file_path = tempname() . "_" . curr_file_name . ".exe"

    let compile_cmd = $"{s:cc} {s:cflags} {curr_file_path} -o {exe_file_path}"
    let run_cmd = $"{exe_file_path}"

    let cmd = $"{compile_cmd} && {run_cmd}"

    call ExecuteShellCommand(cmd)
endfunction

function RunCProgram()
    if s:cc ==# "cl"
        call s:RunMSVC()
    elseif s:cc ==# "clang"
        call s:RunClang()
    endif
endfunction
