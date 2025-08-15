-------------
-- GRUVBOX --
-------------
return {
	{ "ellisonleao/gruvbox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "NTBBloodbath/doom-one.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "olimorris/onedarkpro.nvim" },
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
