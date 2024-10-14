return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				-- Set the name of the NvimTree window to "NvimTree"
				float = {
					enable = true,
					open_win_config = {
						border = "rounded",  -- Optional, for aesthetics
					},
				},
			},
			renderer = {
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
		})

		-- Remove the "Lua" label from the window (optional)
		vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
		vim.opt.winbar = nil  -- Remove the winbar if using it

		-- Key mappings
		vim.keymap.set({ "n", "i", "v" }, "<c-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}

