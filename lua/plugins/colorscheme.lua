return {
  {
    'ful1e5/onedark.nvim',
    name = "onedark",
    priority = 1000,
    --config = function()
    --  vim.cmd.colorscheme("onedark")
    --end,
  },
  {
    "catppuccino/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
