return {
	"lewis6991/satellite.nvim",
	excluded_fy = { "undotree" },
	opts = {
		current_only = false,
		winblend = 50,
		zindex = 40,
		excluded_filetypes = {},
		width = 2,
		handlers = {
			cursor = {
				enable = true,
				symbols = { "⎺", "⎻", "⎼", "⎽" },
			},
			search = {
				enable = false,
			},
			diagnostic = {
				enable = true,
				signs = { "-", "=", "≡" },
				min_severity = vim.diagnostic.severity.HINT,
			},
			gitsigns = {
				enable = true,
				signs = {
					add = "│",
					change = "│",
					delete = "-",
				},
			},
			marks = {
				enable = true,
				show_builtins = false,
				key = "m",
			},
			quickfix = {
				signs = { "-", "=", "≡" },
			},
		},
	},
}
