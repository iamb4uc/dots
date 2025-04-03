-------------
-- GRUVBOX --
-------------
return {
	{ "ellisonleao/gruvbox.nvim" },
	{
		"rebelot/kanagawa.nvim",
		event = "VeryLazy",
	},
	{
		"NTBBloodbath/doom-one.nvim",
		event = "VeryLazy",
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
