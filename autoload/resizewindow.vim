function resizewindow#resize(times, direction)
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
endfunction
