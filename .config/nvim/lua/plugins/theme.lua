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
			colorscheme = "doom-one",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
