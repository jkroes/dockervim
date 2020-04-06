" C-g is much slower than C-c. Esc is reserved for insert mode, which leaves
" C-c to exit clap buffers
silent! iunmap <buffer> <C-g>
silent! <buffer> <C-g>
