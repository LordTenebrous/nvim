local os_name = vim.loop.os_uname().sysname

if os_name == "FreeBSD" then
return {
  -- FreeBSD specific configuration
    require('lspconfig').clangd.setup{}
}
else
return {
  {
    "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
        end,
  },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "clangd", "marksman" },
            })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            capabilities = capabilities
            })
      lspconfig.clangd.setup({
          capabilities = capabilities
          })
      lspconfig.marksman.setup({
          capabilities = capabilities
          })
      vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
end
