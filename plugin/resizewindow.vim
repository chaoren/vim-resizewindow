if exists('g:loaded_resizewindow')
	finish
endif
let g:loaded_resizewindow = 1

if !exists("g:resizewindow_mappings")
	let g:resizewindow_mappings = 1
endif

let s:names = { 'h': 'Left', 'j' : 'Down', 'k' : 'Up', 'l' : 'Right' }
let s:flags = { 'h' : '<', 'j' : '+', 'k' : '-', 'l' : '>' }

for s:direction in [ 'h', 'j', 'k', 'l' ] " {{{
	for s:mode in [ 'n', 'x', 'o' ]
		let s:map = s:mode . 'noremap <silent>'
		let s:lhs = '<Plug>ResizeWindow' . s:names[s:direction]
		let s:d = "'" . s:flags[s:direction] . "'"
		let s:args = join([ 'v:count1', s:d ], ', ')
		let s:rhs = ':<C-U>call <SID>ResizeWindow(' . s:args . ')<CR>'
		execute s:map s:lhs s:rhs

		if !hasmapto(s:lhs, s:mode) && g:resizewindow_mappings
			let s:map2 = s:mode . 'map'
			let s:keys = '<C-W><C-' . toupper(s:direction) . '>'
			execute s:map2 s:keys s:lhs
		endif
	endfor
endfor " }}}

function! <SID>ResizeWindow(times, direction) abort " {{{
	let l:direction = a:direction
	let l:movement = { '<' : 'l', '-' : 'j', '+' : 'j', '>' : 'l' }
	let l:opposite = { '<' : '>', '-' : '+', '+' : '-', '>' : '<' }
	let l:winnr = winnr()
	execute 'wincmd' l:movement[l:direction]
	if winnr() == l:winnr
		let l:direction = l:opposite[l:direction]
	else
		execute l:winnr . 'wincmd' 'w'
	endif
	execute a:times 'wincmd' l:direction
endfunction " }}}

" vim:fdm=marker
