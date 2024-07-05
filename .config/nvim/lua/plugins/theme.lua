-------------
-- GRUVBOX --
-------------
return {
	{ "ellisonleao/gruvbox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "NTBBloodbath/doom-one.nvim" },

	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "kanagawa-dragon",
			colorscheme = "gruvbox",
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
