if exists("g:source_term_utils")
    finish
endif
let g:source_term_utils = v:true

source $HOME/.config/vim/scripts/utils/input_utils.vim

function ExecuteShellCommand(cmd)
    let cmd = $"{&shell} -c \"{a:cmd}\""
    execute $"term {cmd}"
endfunction

function InvokeShellCommand()
    call ExecuteShellCommand(Input("Enter shell command"))
endfunction

nnoremap <Leader>c <Cmd>call InvokeShellCommand()<CR>
