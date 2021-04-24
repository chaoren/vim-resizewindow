let s:cmd = has('patch-8.2.1978') ? "\<Cmd>" : ":\<C-U>"

function resizewindow#cmd(expr)
	return s:cmd.a:expr."\<CR>"
endfunction

function resizewindow#resize(times, direction)
	if winnr('$') == 1
		return
	endif
	let l:direction = a:direction
	let l:movements = {'<': 'l', '-': 'j', '+': 'j', '>': 'l'}
	let l:winnr = winnr()
	let l:movement = l:movements[l:direction]
	execute 'wincmd' l:movement
	if winnr() == l:winnr
		execute 'wincmd' {'l': 'h', 'j': 'k'}[l:movement]
		if winnr() == l:winnr
			return
		endif
		let l:opposites = {'<': '>', '-': '+', '+': '-', '>': '<'}
		let l:direction = l:opposites[l:direction]
	endif
	if winnr() != l:winnr
		execute l:winnr.'wincmd' 'w'
	endif
	execute a:times 'wincmd' l:direction
endfunction
