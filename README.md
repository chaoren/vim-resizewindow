# More intuitive way to resize windows in Vim [![Build Status][1]][2]

This plugin provides direction based resizing of windows.

Using `<C-W>+`, `<C-W>-`, `<C-W><`, and `<C-W>>` to resize windows can be
disorienting since `<C-W><` and `<C-W>>` look like they should always be moving
the window divider left and right, respectively, but they don't if you're in the
right most window.

## Customization

The default mappings are `<C-W><C-H>`, `<C-W><C-J>`, `<C-W><C-K>`, and
`<C-W><C-L>`.

### `g:resizewindow_nomap`

Use `g:resizewindow_nomap` to get `<Plug>` mappings only.\
E.g.,
```
nmap <C-W>< <Plug>ResizeWindowLeft
nmap <C-W>+ <Plug>ResizeWindowDown
nmap <C-W>- <Plug>ResizeWindowUp
nmap <C-W>> <Plug>ResizeWindowRight
```

[1]: https://travis-ci.com/chaoren/vim-resizewindow.svg?branch=master
[2]: https://travis-ci.com/chaoren/vim-resizewindow
