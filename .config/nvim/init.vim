"{{{ Plug 
call plug#begin(stdpath('data') . '/plugged')
" Startpage
Plug 'mhinz/vim-startify'
"Plug 'kevinoid/vim-jsonc'

"File Browsing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File Browser
Plug 'scrooloose/nerdTree'
Plug 'ryanoasis/vim-devicons'
"
" Status Line
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Keybind mini buffer
Plug 'liuchengxu/vim-which-key'

" Languages
Plug 'rust-lang/rust.vim'

"Themes
Plug 'rakr/vim-one'
Plug 'dikiaap/minimalist'
Plug 'dylanaraps/wal.vim'
" Plug 'ntk148v/vim-horizon'
call plug#end()
"}}}

"{{{ Options 
set ignorecase
set autoindent
set incsearch
"turn termguicolors off when using wal theme
"set termguicolors
"Hide <-- Insert -->Text(Bottom) because we're using linelight
set noshowmode
set number
set relativenumber
set foldmethod=marker
set nowrap
set splitright
set splitbelow

syntax on
"colorscheme minimalist
colorscheme wal
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let mapleader = "\<Space>"

function! CustomFoldText()
	let line= getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart
	let line_text = substitute(line, '^[;|"] *{\+', '', 'g')
	let fillcharcount = &textwidth -len(line_text) -len(folded_line_num)
	return '+'. line_text . '(' . folded_line_num . 'L) ' 
endfunction
set foldtext=CustomFoldText()
"}}}

" {{{ Import plugin configs
source $HOME/.config/nvim/plug-conf/nerdtree.vim
source $HOME/.config/nvim/plug-conf/fzf.vim
source $HOME/.config/nvim/plug-conf/coc.vim
source $HOME/.config/nvim/plug-conf/rnvimr.vim
source $HOME/.config/nvim/plug-conf/which-key.vim
" }}}

"{{{ Custom Keybinds
" Move a line up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv"
" Move between open 'windows'
map <leader>wh :wincmd h<CR>
map <leader>wj :wincmd j<CR>
map <leader>wk :wincmd k<CR>
map <leader>wl :wincmd l<CR>
" Other
map <leader>fs :w<CR>
map <leader>fq :wq<CR>
map <leader>ff :Files<CR>
map <leader>fr :RnvimrToggle<CR>
map <leader>qq :q<CR>
map <leader>qd :q!<CR>
map <leader>bl :bnext<CR>
map <leader>bh :bprevious<CR>
map <leader>bb :Buffers<CR>
map <leader>bd :bdelete<CR>
" }}}
