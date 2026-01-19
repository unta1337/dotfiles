if exists("g:source_input_utils")
    finish
endif
let g:source_input_utils = v:true

function Input(prompt, default = v:null)
    let prompt = a:prompt
    if a:default isnot v:null
        let prompt = $"{prompt} (default: `{a:default}`)"
    endif
    let prompt = prompt . ": "

    let input_str = input(prompt)
    if input_str ==# ""
        let input_str = a:default
    endif

    return input_str
endfunction
