"{{{ nerdTree 
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeDirArrowExpandable = 'ﰲ'
let g:NERDTreeDirArrowCollapsible = 'ﰬ'
let g:NERDTreeNaturalSort = 1

" Automaticaly close nvim if NERDTree is only thing left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"NERDTree Git plugin
let g:NERDTreeGitStatusUseNerdFonts = 1

" }}}
