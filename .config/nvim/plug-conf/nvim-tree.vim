"let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
"let g:nvim_tree_auto_ignore_ft = 'startify' 
let g:nvim_tree_disable_netrw = 1
let g:nvim_tree_hijack_netrw = 1

lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["<CR>"] = ":YourVimFunction()<cr>",
      ["u"] = ":lua require'some_module'.some_function()<cr>",

      -- default mappings
      ["<CR>"]           = tree_cb("vsplit"),
      ["l"]              = tree_cb("edit"),
      ["<2-LeftMouse>"]  = tree_cb("edit"),
      ["<2-RightMouse>"] = tree_cb("cd"),
      ["c"]              = tree_cb("cd"),
      ["v"]              = tree_cb("vsplit"),
      ["s"]              = tree_cb("split"),
      ["t"]              = tree_cb("tabnew"),
      ["<BS>"]           = tree_cb("close_node"),
      ["h"]              = tree_cb("close_node"),
      ["<Tab>"]          = tree_cb("preview"),
      ["I"]              = tree_cb("toggle_ignored"),
      ["H"]              = tree_cb("toggle_dotfiles"),
      ["R"]              = tree_cb("refresh"),
      ["a"]              = tree_cb("create"),
      ["x"]              = tree_cb("remove"),
      ["r"]              = tree_cb("rename"),
      ["<C-r>"]          = tree_cb("full_rename"),
      ["d"]              = tree_cb("cut"),
      ["y"]              = tree_cb("copy"),
      ["p"]              = tree_cb("paste"),
      ["<C-p>"]          = tree_cb("prev_git_item"),
      ["<C-n>"]          = tree_cb("next_git_item"),
      ["u"]              = tree_cb("dir_up"),
      ["q"]              = tree_cb("close"),
    }
EOF

