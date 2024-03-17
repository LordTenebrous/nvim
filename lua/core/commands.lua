-- Mapping Escape to switch from terminal mode to normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- Mapping :q! in terminal mode to switch to normal mode and then quit
vim.keymap.set('t', ':q!', '<C-\\><C-n>:q!<CR>', {noremap = true, silent = true})

