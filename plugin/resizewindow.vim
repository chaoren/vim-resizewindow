if exists('g:loaded_resizewindow')
	finish
endif
let g:loaded_resizewindow = 1

let s:mappings = get(g:, 'resizewindow_mappings', { })

let s:flags = { 'h' : '<', 'j' : '+', 'k' : '-', 'l' : '>' }

for s:direction in [ 'h', 'j', 'k', 'l' ] " {{{
	if !has_key(s:mappings, s:direction)
		let s:mappings[s:direction] = '<C-W><C-' . toupper(s:direction) . '>'
	elseif empty(s:mappings[s:direction])
		continue
	endif
	for s:mode in [ 'n', 'x', 'o' ]
		let s:map = s:mode . 'noremap'
		let s:lhs = '<silent>' . s:mappings[s:direction]
		let s:d = "'" . s:flags[s:direction] . "'"
		let s:args = join([ 'v:count1', s:d ], ', ')
		let s:rhs = ':<C-U>call <SID>ResizeWindow(' . s:args . ')<CR>'
		execute s:map s:lhs s:rhs
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
