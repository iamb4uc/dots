require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  -- char = "|",
  buftype_exclude = { "terminal" },
  filetype_exclude = { "alpha", "mason", "netrw", "help", "Packer", "wiki" },
  show_current_context = true,
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}
