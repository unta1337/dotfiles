function CompileAndRun(input_file_path)
    let curr_file_name = expand("%:t")
    let curr_file_name_no_ext = expand("%:t:r")
    let curr_file_path = expand("%:p")

    " cmd := [precmd &&] [input |] <run>
    if &filetype ==# "c"
        let obj_file_path = tempname() . "_" . curr_file_name_no_ext . ".obj"
        let exe_file_path = tempname() . "_" . curr_file_name_no_ext . ".exe"

        let precmd = "cl /F1024000000 " . curr_file_path . " " . "/Fo" . obj_file_path . " " . "/Fe" . exe_file_path
        let runcmd = exe_file_path
    elseif &filetype ==# "cpp"
        let obj_file_path = tempname() . ".obj"
        let exe_file_path = tempname() . ".exe"

        let precmd = "cl /F1024000000 /EHsc /std:c++17 " . curr_file_path . " " . "/Fo" . obj_file_path . " " . "/Fe" . exe_file_path
        let runcmd = exe_file_path
    elseif &filetype ==# "python"
        let precmd = v:null
        let runcmd = "python " . curr_file_path
    elseif &filetype ==# "ruby"
        let precmd = v:null
        let runcmd = "ruby " . curr_file_path
    else
        echo "[ERROR] Compile and Run: Unknown file type `" . &filetype . "`."
        return
    endif

    if a:input_file_path isnot v:null
        let runcmd = "cat " . (a:input_file_path !=# "" ? a:input_file_path : "input.txt") . " | " . runcmd
    endif
    let cmd = (precmd isnot v:null ? precmd . " && " : "") . runcmd

    execute "term pwsh -c " . cmd
    echo $"[INFO] Compile and Run: \{target: {curr_file_name}, input: {a:input_file_path}\}"
endfunction

" Key Bindings
nnoremap <Leader>x :call CompileAndRun(v:null)<CR>
nnoremap <Leader>xi :call CompileAndRun(input("[INFO] Enter your input file path (default: `input.txt`): "))<CR>

function OpenFileUnderCursorWithPosInNewTab()
    let line = getline(".")
    let line_num = matchlist(line, "\\v.*\\((\\d+)\\):")[1]
    execute $"normal! gf:{line_num}"
endfunction

nnoremap <Leader>f :call OpenFileUnderCursorWithPosInNewTab()<CR>
