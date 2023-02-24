require "staline".setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = {},
		right = {'file_name', 'line_column' }
	},
	mode_colors = {
    n = "#b8bb26",
    i = "#d3869b",
    c = "#fb4934",
    v = "#fabd2f",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}
}

require('stabline').setup()
