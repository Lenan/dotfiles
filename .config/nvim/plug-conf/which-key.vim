let g:which_key_hspace = 1
"let g:which_key_use_floating_win = 1
"let g:which_key_floating_relative_win = 1
let g:which_key_disable_default_offset = 1
let g:which_key_sep = '=>'

let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")

" leave these keybindings here!!
nmap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vmap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map.b   = { 'name' : '+buffer' }
let g:which_key_map.b.l = 'next buffer'
let g:which_key_map.b.h = 'previous buffer'
let g:which_key_map.b.b = 'browse buffers'
let g:which_key_map.b.d = 'delete buffer'

let g:which_key_map.f   = { 'name' : '+files' }
let g:which_key_map.f.s = 'save'
let g:which_key_map.f.q = 'save and quit'
let g:which_key_map.f.e = 'edit'
let g:which_key_map.f.f = 'browse files (fzf)'
let g:which_key_map.f.r = 'browse files (ranger)'

let g:which_key_map.q   = { 'name' : '+quit' }
let g:which_key_map.q.q = 'quit'
let g:which_key_map.q.d = 'force quit'

let g:which_key_map.w   = { 'name' : '+windows' }
let g:which_key_map.w.h = 'move to left window'
let g:which_key_map.w.j = 'move to down window'
let g:which_key_map.w.k = 'move to up window'
let g:which_key_map.w.l = 'move to right window'
let g:which_key_map.w.b = 'browse windows'

let g:which_key_map.c   = { 'name' : '+coc'}

let g:which_key_map.n   = { 'name' : 'project drawer' }
let g:which_key_map.n.t = 'toggle project drawer'

let g:which_key_map.p   = { 'name' : '+prettify'}
let g:which_key_map.p.a = 'easy align (selection needed)'

let g:which_key_map.e   = { 'name' : '+easymotion' }
let g:which_key_map.e.w = 'move to word (local)'
let g:which_key_map.e.W = 'move to word (global)'
let g:which_key_map.e.l = 'move to line (local)'
let g:which_key_map.e.L = 'move to line (global)'
let g:which_key_map.e.f = 'easymotion 2 characters (local)'
let g:which_key_map.e.F = 'easymotion 2 characters (global)'
