return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local function set_lualine_theme(theme)
            require("lualine").setup({
                options = {
                    theme = theme,
                },
            })
        end

        -- Set the initial Lualine theme (same as colorscheme)
        set_lualine_theme("catppuccin-macchiato")
    end,
}

