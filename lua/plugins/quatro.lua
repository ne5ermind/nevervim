return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
		"benlubas/molten-nvim",
	},
	ft = { "quarto", "markdown" },
	init = function()
		vim.filetype.add({
			extension = {
				qmd = "quarto",
			},
		})
	end,
	opts = {
		lspFeatures = {
			languages = { "python", "r" },
			chunks = "all",
			diagnostics = {
				enabled = true,
				triggers = { "BufWritePost" },
			},
			completion = {
				enabled = true,
			},
		},
		keymap = {
			hover = "H",
			definition = "gd",
			rename = "<leader>rn",
			references = "gr",
			format = "<leader>gf",
		},
		codeRunner = {
			enabled = true,
			default_method = "molten",
		},
	},
	keys = {
		{
			"<localleader>rc",
			function()
				require("quarto.runner").run_cell()
			end,
			desc = "Run Quarto cell",
			mode = "n",
		},
		{
			"<localleader>ra",
			function()
				require("quarto.runner").run_above()
			end,
			desc = "Run cell and above",
			mode = "n",
		},
		{
			"<localleader>rA",
			function()
				require("quarto.runner").run_all()
			end,
			desc = "Run all cells",
			mode = "n",
		},
		{
			"<localleader>rl",
			function()
				require("quarto.runner").run_line()
			end,
			desc = "Run current line",
			mode = "n",
		},
		{
			"<localleader>r",
			function()
				require("quarto.runner").run_range()
			end,
			desc = "Run visual range",
			mode = "v",
		},
		{
			"<localleader>RA",
			function()
				require("quarto.runner").run_all(true)
			end,
			desc = "Run all cells (all languages)",
			mode = "n",
		},
	},
}
