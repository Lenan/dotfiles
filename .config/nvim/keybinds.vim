    "{{{ Custom Keybinds
    let mapleader = "\<Space>"
    """" WINDOWS
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
    nnoremap <silent> <leader>wH :vertical res -5<CR>
    nnoremap <silent> <leader>wL :vertical res +5<CR>
    nnoremap <silent> <A-r> :vertical res -5<CR>
    nnoremap <silent> <A-R> :vertical res +5<CR>


    """" FILES
    nnoremap <leader>fs :w<CR>
    nnoremap <leader>fq :wq<CR>
    nnoremap <leader>fe :edit<Space>
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser()<cr>
    nnoremap <leader>fr :RnvimrToggle<CR>
    nnoremap <leader>nt :NvimTreeToggle<CR>
    nnoremap <leader>nf :NvimTreeFindFile<CR>
    nnoremap <leader>nr :NvimTreeRefresh<CR>
    """" BUFFER 
    " Buffer Navigation
    "nnoremap <silent> <leader>bl :bnext<CR>
    "nnoremap <silent> <leader>bh :bprevious<CR>
    "nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
    "" Keep window open after deleting buffer
    "nnoremap <silent> <leader>bd :Bdelete<CR>
    "" Close window after deleting buffer
    "nnoremap <silent> <leader>bD :bdelete<CR>

    """"""""with barbar plugin
    nnoremap <leader>bh :BufferPrevious<CR>
    nnoremap <silent> <A-h> :BufferPrevious<CR>
    nnoremap <leader>bl :BufferNext<CR>
    nnoremap <silent> <A-l> :BufferNext<CR>
    nnoremap <leader>bk :BufferMovePrevious<CR>
    nnoremap <silent> <A-<> :BufferMovePrevious<CR>
    nnoremap <leader>bj :BufferMoveNext<CR>
    nnoremap <silent> <A->> :BufferMoveNext<CR>
    nnoremap <leader>bd :BufferClose<CR>
    nnoremap <leader>bD :BufferCloseAllButCurrent<CR>
    nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<CR>

    """" QUICK NAVIGATION
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

    """" CODE MODIFICATION
    nmap <leader>ca <Plug>(EasyAlign)
    xmap <leader>ca <Plug>(EasyAlign)
    nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<cr>

    """" PROJECTS
    nnoremap <silent> <leader>pb :Startify<CR>
    nnoremap <silent> <leader>ps :SSave<CR>
    nnoremap <silent> <leader>po :SLoad<CR>
    nnoremap <silent> <leader>pd :SClose<CR>
    nnoremap <silent> <leader>px :SDelete<CR>

    """" MISC
    nnoremap <leader>qq :q<CR>
    nnoremap <leader>qd :q!<CR>
    nnoremap <leader>qc :cclose<CR>

    " Move line(s) up or down
    nnoremap <silent> <A-j> :m .+1<CR>==
    nnoremap <silent> <A-k> :m .-2<CR>==
    inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
    inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
    vnoremap <silent> <A-k> :m '<-2<CR>gv=gv"

    " }}}
