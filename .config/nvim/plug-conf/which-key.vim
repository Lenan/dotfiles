let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map.b = { 'name' : '+buffer' }
let g:which_key_map.b.l = 'next buffer' 
let g:which_key_map.b.h = 'previous buffer' 
let g:which_key_map.b.b = 'browse buffers' 
let g:which_key_map.b.d = 'delete buffer' 

let g:which_key_map.f = { 'name' : '+files' }
let g:which_key_map.f.s = 'save file'
let g:which_key_map.f.q = 'save and quit'
let g:which_key_map.f.f = 'browse files (fzf)'
let g:which_key_map.f.r = 'browse files (ranger)' 

let g:which_key_map.q = { 'name' : '+quit' }
let g:which_key_map.q.q = 'quit' 
let g:which_key_map.q.d = 'force quit' 

let g:which_key_map.w = { 'name' : '+windows' }
let g:which_key_map.w.h = 'move to left window' 
let g:which_key_map.w.j = 'move to down window'
let g:which_key_map.w.k = 'move to up window'
let g:which_key_map.w.l = 'move to right window'

let g:which_key_map.c = { 'name' : '+coc'} 
let g:which_key_map.n = { 'name' : '+nerdtree' }
let g:which_key_map.n.t = 'toggle nerdtree' 

