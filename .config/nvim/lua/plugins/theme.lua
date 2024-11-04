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
			colorscheme = "gruvbox",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
