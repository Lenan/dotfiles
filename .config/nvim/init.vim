"{{{ Plug 
call plug#begin(stdpath('data') . '/plugged')
" Startpage
Plug 'mhinz/vim-startify'

"File Browsing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'

"Plug 'scrooloose/nerdTree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/glyph-palette.vim'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Text Editing/Formatting/Aligning
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'

" Navigation
Plug 'easymotion/vim-easymotion'

" Status Line
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Gutter
Plug 'airblade/vim-gitgutter'

" Key preview mini buffer
Plug 'liuchengxu/vim-which-key'

" Languages
Plug 'rust-lang/rust.vim'

"Color Preview
Plug 'https://github.com/ap/vim-css-color'

"Themes
Plug 'rakr/vim-one'
Plug 'dikiaap/minimalist'
Plug 'dylanaraps/wal.vim'
Plug 'tomasiser/vim-code-dark'
" Plug 'ntk148v/vim-horizon'

"Misc
Plug 'moll/vim-bbye'

call plug#end()
"}}}

"{{{ Options 
set ignorecase
set smartcase
set autoindent
set incsearch
set nohlsearch

"turn termguicolors off when using wal theme
set termguicolors
"Hide <-- Insert -->Text(Bottom) because we're using linelight
"set noshowmode
set number
set relativenumber
set foldmethod=marker
set nowrap
set updatetime=300
set timeoutlen=100

set splitright
set splitbelow

set scrolloff=5

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
syntax on
filetype plugin indent on

let mapleader = "\<Space>"

"colorscheme minimalist
"colorscheme wal
colorscheme codedark
"let g:airline_theme='minimalist'
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

function! CustomFoldText()
	let line= getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart
	let line_text = substitute(line, '^[;|"] *{\+', '', 'g')
	let fillcharcount = &textwidth -len(line_text) -len(folded_line_num)
	return '+'. line_text . '(' . folded_line_num . 'L) ' 
endfunction
set foldtext=CustomFoldText()
"}}}

"{{{ Import keybinds
source $HOME/.config/nvim/keybinds.vim
"}}}

"{{{ Import plugin configs
"source $HOME/.config/nvim/plug-conf/nerdtree.vim
source $HOME/.config/nvim/plug-conf/fern.vim
source $HOME/.config/nvim/plug-conf/fzf.vim
source $HOME/.config/nvim/plug-conf/coc.vim
source $HOME/.config/nvim/plug-conf/rnvimr.vim
source $HOME/.config/nvim/plug-conf/easy-align.vim
source $HOME/.config/nvim/plug-conf/easymotion.vim
source $HOME/.config/nvim/plug-conf/which-key.vim
"}}}

