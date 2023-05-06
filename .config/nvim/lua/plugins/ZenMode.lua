-- ____________________  _______________ ______  __________
-- ____  _/__    |__   |/  /__  __ )_  // /_  / / /_  ____/
--  __  / __  /| |_  /|_/ /__  __  |  // /_  / / /_  /
-- __/ /  _  ___ |  /  / / _  /_/ //__  __/ /_/ / / /___
-- /___/  /_/  |_/_/  /_/  /_____/   /_/  \____/  \____/
-- A blazingly fast ZenMode config
-- github.com/iamb4uc for more software

return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 0.65, -- width of the Zen window
				height = 0.75, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			-- callback where you can add custom code when the Zen window opens
			on_open = function(win) end,
			-- callback where you can add custom code when the Zen window closes
			on_close = function() end,
		})
	end,
	keys = {
		{
			"<leader>z",
			":ZenMode<CR>",
			desc = "ZenMode Toggle",
		},
	},
}
