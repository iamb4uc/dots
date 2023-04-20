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
      "<leader>fb",
      function()
        require("telescope.builtin").buffers({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Load Buffers",
    },
    {
      "<leader>fo",
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
      layout_config = { prompt_position = "top" },
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
