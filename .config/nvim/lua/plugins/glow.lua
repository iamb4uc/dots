return {
	"ellisonleao/glow.nvim",
	config = function()
		require("glow").setup({
			style = "dark",
			width = 120,
		})
	end,
	keys = {
		{
			"<leader>G",
			":Glow!<CR>",
			desc = "Glow Toggle",
		},
	},
}
