return {
  "vimwiki/vimwiki",
  keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>ww",
      ":VimwikiIndex<CR>",
      desc = "VimWiki Index",
    },
    {
      "<leader>w<leader>w",
      ":VimwikiMakeDiaryNote<CR>",
      desc = "Make Today's Diary Note",
    },
    {
      "<leader>w<leader>i",
      ":VimwikiDiaryGenerateLinks<CR>",
      desc = "Generate Diary Links",
    },
    {
      "<leader>wi",
      ":VimwikiDiaryIndex<CR>",
      desc = "Diary Index",
    },
  },
}
