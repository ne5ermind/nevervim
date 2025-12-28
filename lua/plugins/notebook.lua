return {
	"meatballs/notebook.nvim",
	opts = {
		insert_blank_line = true,
		show_index = true,
		show_cell_type = true,
		virtual_text_style = { fg = "lightblue", italic = true },
	},
	keys = {
		{
			"<leader>ac",
			function()
				vim.cmd("write")(":NBAddCell<CR>")
			end,
			desc = "Create a new cell at the end of the file",
			mode = "n",
		},

		{
			"<leader>ic",
			function()
				vim.cmd("write")(":NBInsertCell<CR>")
			end,
			desc = "Insert a cell below",
			mode = "n",
		},

		{
			"<leader>dc",
			function()
				vim.cmd("write")(":NBDeleteCell<CR>")
			end,
			desc = "Delete the current cell",
			mode = "n",
		},

		{
			"<leader>mcu",
			function()
				vim.cmd("write")(":NBMoveCellUp<CR>")
			end,
			desc = "Move the current cell up",
			mode = "n",
		},

		{
			"<leader>mcd",
			function()
				vim.cmd("write")(":NBMoveCellDown<CR>")
			end,
			desc = "Move the cuurent cell down",
			mode = "n",
		},
	},
}
