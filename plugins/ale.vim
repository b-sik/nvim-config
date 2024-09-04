" Enable ALE
let g:ale_enabled = 1

function! FormatHtmldjango(buffer) abort
    return {
    \   'command': 'djlint - --reformat --preserve-blank-lines'
    \}
endfunction

execute ale#fix#registry#Add('djlint', 'FormatHtmldjango', ['htmldjango'], 'djlint for htmldjango')
" Use specific linters and fixers "

let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'typescript': ['eslint'],
		\   'python': ['autopep8'],
    \}

let g:ale_fixers = {
		\   '*': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier', 'eslint'],
    \   'typescript': ['prettier', 'eslint'],
		\   'python': ['autopep8'],
		\   'html': ['prettier'],
		\   'css': ['prettier'],
    \   'php': ['phpcbf'],
    \   'htmldjango': ['djlint']
    \}

let g:ale_php_phpcbf_standard = 'WordPress'

" Set default fixer
let g:ale_fix_on_save = 1
