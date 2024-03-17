return {
    'preservim/tagbar',
    config = function()
        vim.keymap.set('n', '<c-t>', '<Esc>:TagbarToggle<CR>', {noremap = true, silent = true})
        vim.keymap.set('i', '<c-t>', '<Esc>:TagbarToggle<CR>', {noremap = true, silent = true})
        vim.g.tagbar_autofocus = 1
    end
}
