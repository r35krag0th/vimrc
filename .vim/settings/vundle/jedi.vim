" Python Jedi for Vim
" (?) Automatically Init with Vim? (default=1)
let g:jedi#auto_initialization = 1

" (?) Automatically init Vim config? (default=1)
let g:jedi#auto_vim_configuration = 1

" (?) Make Jedi-Vim use tabs when going to defs? (default=1)
let g:jedi#use_tabs_not_buffers = 1

" (?) If you like to use splits... (left, right, top, bottom, winwidth)
" let g:jedi#use_splits_not_buffers = "left"

" (?) Jedi automatically starts completion if you type something. (default=1)
let g:jedi#popup_on_dot = 1

" (?) Auto-select the first thing in the menu? (default=1)
let g:jedi#popup_select_first = 1

" (?) Show func signature when in insert mode (in real-time)
"   > 1 = Pop Up in Buffer (default)
"   > 2 = In Vim CmdLine
let g:jedi#show_call_signatures = 1

" Jedi Key Bindings
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
