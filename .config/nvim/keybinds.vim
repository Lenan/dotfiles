"{{{ Custom Keybinds
" Move a line up or down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv"

" Windows navigation
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>wb :Windows<CR>
nnoremap <silent> <leader>wd :close<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" Files
nnoremap <leader>fs :w<CR>
nnoremap <leader>fq :wq<CR>
nnoremap <leader>fe :edit<Space>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fr :RnvimrToggle<CR>
"nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
"nnoremap <silent> <leader>nf :NERDTreeFocus<CR>
nnoremap <silent> <leader>nt :Fern . -drawer -toggle -reveal=%<CR>

" Quit fast
nnoremap <leader>qq :q<CR>
nnoremap <leader>qd :q!<CR>

" Buffer Navigation
nnoremap <silent> <leader>bl :bnext<CR>
nnoremap <silent> <leader>bh :bprevious<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
" Keep window open after deleting buffer
nnoremap <silent> <leader>bd :Bdelete<CR> 
" Close window after deleting buffer
nnoremap <silent> <leader>bD :bdelete<CR>

"EasyMotion
nmap f <Plug>(easymotion-bd-f)
nmap F <Plug>(easymotion-overwin-f)

nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <leader>ew <Plug>(easymotion-bd-w)
nmap <leader>eW <Plug>(easymotion-overwin-w)
nmap <leader>el <Plug>(easymotion-bd-jk)
nmap <leader>eL <Plug>(easymotion-overwin-line)
nmap <leader>ef <Plug>(easymotion-bd-f2)
nmap <leader>eF <Plug>(easymotion-overwin-f2)

"Easy Align
nmap <leader>pa <Plug>(EasyAlign)
xmap <leader>pa <Plug>(EasyAlign)

" Make pretty
nnoremap <silent> <leader>pf :Format<CR>
" }}}
