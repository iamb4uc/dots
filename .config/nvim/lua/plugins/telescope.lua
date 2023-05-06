-- ____________________  _______________ ______  __________
-- ____  _/__    |__   |/  /__  __ )_  // /_  / / /_  ____/
--  __  / __  /| |_  /|_/ /__  __  |  // /_  / / /_  /
-- __/ /  _  ___ |  /  / / _  /_/ //__  __/ /_/ / / /___
-- /___/  /_/  |_/_/  /_/  /_____/   /_/  \____/  \____/
-- A blazingly fast telescope config
-- github.com/iamb4uc for more software

return {
	"nvim-telescope/telescope.nvim",
	keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>ff",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({ cwd = require("lazy.core.config").options.root })
			end,
			desc = "Find Word",
		},
		{
			"<leader>,",
			function()
				require("telescope.builtin").buffers({ cwd = require("lazy.core.config").options.root })
			end,
			desc = "Load Buffers",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles({ cwd = require("lazy.core.config").options.root })
			end,
			desc = "Find Old Files",
		},
		{
			"<leader>ht",
			function()
				require("telescope.builtin").colorscheme({ cwd = require("lazy.core.config").options.root })
			end,
			desc = "Load Colorscheme",
		},
	},
	-- change some options
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "bottom" },
			sorting_strategy = "ascending",
			winblend = 0,
		},
	},
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
}
