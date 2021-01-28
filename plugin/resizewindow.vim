if exists('g:loaded_resizewindow')
	finish
endif
let g:loaded_resizewindow = 1

nnoremap <silent><expr><Plug>ResizeWindowLeft  resizewindow#cmd('call resizewindow#resize(v:count1, "<")<CR>')
nnoremap <silent><expr><Plug>ResizeWindowDown  resizewindow#cmd('call resizewindow#resize(v:count1, "+")<CR>')
nnoremap <silent><expr><Plug>ResizeWindowUp    resizewindow#cmd('call resizewindow#resize(v:count1, "-")<CR>')
nnoremap <silent><expr><Plug>ResizeWindowRight resizewindow#cmd('call resizewindow#resize(v:count1, ">")<CR>')

if !get(g:, 'resizewindow_nomap', 0)
	nmap <C-W><C-H> <Plug>ResizeWindowLeft
	nmap <C-W><C-J> <Plug>ResizeWindowDown
	nmap <C-W><C-K> <Plug>ResizeWindowUp
	nmap <C-W><C-L> <Plug>ResizeWindowRight
endif
