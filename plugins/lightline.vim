let g:lightline = {
      \ 'colorscheme': 'selenized_dark',
      \ 'active': {
      \    'left': [ ['mode', 'paste'],
      \     ['cocstatus', 'readonly', 'filename', 'modified']]
      \ },
      \ 'component_function': {
      \ 'cocstatus': 'coc#status'
      \ },
      \ }

let s:colour_scheme_map = {'kanagawa-dragon': 'selenized_black', 'kanagawa-wave': 'selenized_dark', 'kanagawa-lotus': 'selenized_light'}

augroup lightline-events
	autocmd!
	autocmd ColorScheme * call s:onColorSchemeChange(expand("<amatch>"))
augroup END

function! s:onColorSchemeChange(scheme)
	" Try a scheme provided already
	let l:colors_name = get(s:colour_scheme_map, a:scheme, '')
	if empty(l:colors_name)
		return
	else
		let g:lightline.colorscheme = l:colors_name
	endif
	call lightline#init()
	call lightline#colorscheme()
	call lightline#update()
endfunction

"call s:onColorSchemeChange(s:colour_scheme_map)
