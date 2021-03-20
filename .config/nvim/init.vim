"{{{ Plug 
call plug#begin(stdpath('data') . '/plugged')
" Startpage
Plug 'mhinz/vim-startify'

"File Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'easymotion/vim-easymotion'
Plug 'romgrk/barbar.nvim'

" Intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Text Editing/Formatting/Aligning/Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'frazrepo/vim-rainbow'

" Status Line
Plug 'itchyny/lightline.vim'

" Gutter
Plug 'airblade/vim-gitgutter'

" Key preview mini buffer
Plug 'liuchengxu/vim-which-key'

" Languages
Plug 'rust-lang/rust.vim'

"Color Preview
Plug 'norcalli/nvim-colorizer.lua'

"Themes
Plug 'rakr/vim-one'
Plug 'dikiaap/minimalist'
Plug 'tomasiser/vim-code-dark'
Plug 'nekonako/xresources-nvim'

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
set noshowmode
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

"colorscheme codedark
colorscheme xresources
"use this with xresources theme
highlight Folded ctermfg=gray guifg=gray
let g:lightline = { 'colorscheme' : 'powerlineish' }

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
source ~/.config/nvim/keybinds.vim
"}}}

"{{{ Import plugin configs
source ~/.config/nvim/plug-conf/startify.vim
source ~/.config/nvim/plug-conf/lsp-config.vim
source ~/.config/nvim/plug-conf/fzf.vim
source ~/.config/nvim/plug-conf/rnvimr.vim
source ~/.config/nvim/plug-conf/easy-align.vim
source ~/.config/nvim/plug-conf/easymotion.vim
source ~/.config/nvim/plug-conf/which-key.vim
source ~/.config/nvim/plug-conf/nvim-tree.vim

luafile ~/.config/nvim/lua/plug/compe.lua
luafile ~/.config/nvim/lua/plug/telescope.lua
luafile ~/.config/nvim/lua/plug/colorizer.lua
luafile ~/.config/nvim/lua/plug/treesitter.lua
"LSP
luafile ~/.config/nvim/lua/lspconfig/rust.lua
luafile ~/.config/nvim/lua/lspconfig/lualsp.lua
luafile ~/.config/nvim/lua/lspconfig/python-jedi.lua
"}}}

