return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
		vim.keymap.set({ "n", "i", "v" }, "<c-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.keymap.set({ "n", "i", "v" }, "<c-f>", "<Esc>:NvimTreeFocus<CR>", { noremap = true, silent = true })
	end,
}
