 " LSP config (the mappings used in the default file don't quite work right)
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent><leader>gc :cclose<CR>

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)
"lua doesnt have an auto-formatter....???
"autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
