return {
    'preservim/tagbar',
    config = function()
        vim.keymap.set({'n', 'i'}, '<leader>tb', '<Esc>:TagbarOpen<CR>', {noremap = true, silent = true})
        vim.keymap.set({'n', 'i'}, '<leader>tc', '<Esc>:TagbarClose<CR>', {noremap = true, silent = true})
        vim.g.tagbar_autofocus = 1
    end
}
