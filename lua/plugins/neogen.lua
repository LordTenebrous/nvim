return {
  'danymat/neogen',
  config = function()
    local neogen = require('neogen')

    neogen.setup {
      enabled = true,
      languages = {
        c = { template = { annotation_convention = 'doxygen' } },
        cpp = { template = { annotation_convention = 'doxygen' } },
      },
    }

    -- Shortcut for generating Doxygen comments
    vim.api.nvim_set_keymap('n', '<leader>nd',
      "<cmd>lua require('neogen').generate()<CR>",
      { noremap = true, silent = true }
    )
  end,
  requires = 'nvim-treesitter/nvim-treesitter',
}

