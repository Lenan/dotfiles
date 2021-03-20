let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

let g:startify_lists = [
            \ { 'type' : 'bookmarks', 'header': ['Bookmarks'] },
            \ { 'type' : 'sessions', 'header': ['Sessions'] },
            \ { 'type' : 'files', 'header': ['Recently Opened'] },
            \ { 'type' : 'dir', 'header': ['Recently Opened ('. getcwd() .')'] },
            \ ]

let g:startify_bookmarks = [
            \ '~/.config/nvim/',
            \ '~/.config/awesome/',
            \ '~/Documents/Projects/Rust/rustlings'
            \ ]
