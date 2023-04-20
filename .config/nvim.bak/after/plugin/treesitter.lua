require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'lua', 'python', 'latex', 'vim', 'php' },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false;
  },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  autopairs = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  }
}
