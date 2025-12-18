" TODO: Split this funtion into running part and dispatch part.
function CompileAndRun()
    let currFileNameNoExt = expand("%:t:r")
    let currFilePath = expand("%:p")
    let tempDirPath = getenv("HOME") . "/.config/vim/temp/"

    if &filetype ==# "c"
        let objFilePath = tempDirPath . currFileNameNoExt . ".obj"
        let exeFilePath = tempDirPath . currFileNameNoExt . ".exe"

        let compCmd = "cl " . currFilePath . " " . "/Fo" . objFilePath . " " . "/Fe" . exeFilePath
        let runCmd = exeFilePath
        let cmd = "pwsh -c " . compCmd . " && " . runCmd
    elseif &filetype ==# "cpp"
        let objFilePath = tempDirPath . currFileNameNoExt . ".obj"
        let exeFilePath = tempDirPath . currFileNameNoExt . ".exe"

        let compCmd = "cl /EHsc /std:c++17 " . currFilePath . " " . "/Fo" . objFilePath . " " . "/Fe" . exeFilePath
        let runCmd = exeFilePath
        let cmd = "pwsh -c " . compCmd . " && " . runCmd
    elseif &filetype ==# "python"
        let cmd = "pwsh -c python " . currFilePath
    elseif &filetype ==# "ruby"
        let cmd = "pwsh -c ruby " . currFilePath
    else
        :echo "[ERROR] CompileAndRun: Unknown file type `" . &filetype . "`."
        return
    endif

    execute "term " . cmd
endfunction

" Key Bindings
nnoremap <Leader>x :call CompileAndRun()<CR>
