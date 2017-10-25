More intuitive way to resize windows in Vim
===========================================

[![Build Status](https://travis-ci.org/chaoren/vim-resizewindow.svg?branch=master)](https://travis-ci.org/chaoren/vim-resizewindow)

This plugin provides direction based resizing of windows.

Using `<C-W>+`, `<C-W>-`, `<C-W><`, and `<C-W>>` to resize windows can be
disorienting since `<C-W><` and `<C-W>>` look like they should always be moving
the window divider left and right, respectively, but they don't if you're in the
right most window.

Customization
=============

The default mappings are `<C-W><C-H>`, `<C-W><C-J>`, `<C-W><C-K>`, and
`<C-W><C-L>`.

Use the `<Plug>ResizeWindow[DIR]` mappings to replace the default mappings.
E.g.
```
map <C-W><C-K> <Plug>ResizeWindowUp
map <C-W><C-J> <Plug>ResizeWindowDown
map <C-W><C-H> <Plug>ResizeWindowLeft
map <C-W><C-L> <Plug>ResizeWindowRight
```
Note that since `<Plug>ResizeWindow[DIR]` is itself a mapping, `noremap` will
not work.
To disable the mapping, set `g:resizewindow_mappings = 0`.
