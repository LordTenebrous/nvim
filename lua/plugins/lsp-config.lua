return {
  -- Mason setup for managing LSP servers (excluding ccls)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason LSP Config setup
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- List other servers to ensure they are installed by Mason
        ensure_installed = { "lua_ls", "marksman" },
      })
    end,
  },
  -- LSP configuration using lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Set up capabilities for autocompletion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- Lua Language Server setup (example for other languages)
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      
      -- ccls setup
      lspconfig.ccls.setup({
        capabilities = capabilities
      })

      -- Marksman (example of other server)
      lspconfig.marksman.setup({
        capabilities = capabilities
      })

      -- Key mappings for LSP functionalities
      vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

