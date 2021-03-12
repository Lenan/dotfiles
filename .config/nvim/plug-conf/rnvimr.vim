" Make ranger the file explorer
" let g:rnvimr_enable_ex = 1

"Hide ranger after opening a file
let g:rnvimr_enable_picker = 1

"Make neovim wipe the buffers corresponding to the files deleted by ranger
let g:rnvimr_enable_bw = 1

let g:rnvimr_shadow_winblend = 50
let g:rnvimr_action = { '<Esc>' : 'exit' }

let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
highlight link RnvimrNormal CursorLine
