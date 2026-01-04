return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.config",
	opts = {
		ensure_installed = {
			"python",
			"lua",
			"luadoc",
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		textobjects = {
			move = {
				enable = true,
				set_jumps = false, -- you can change this if you want.
				goto_next_start = {
					--- ... other keymaps
					["]b"] = { query = "@code_cell.inner", desc = "next code block" },
				},
				goto_previous_start = {
					--- ... other keymaps
					["[b"] = { query = "@code_cell.inner", desc = "previous code block" },
				},
			},
			select = {
				enable = true,
				lookahead = true, -- you can change this if you want
				keymaps = {
					--- ... other keymaps
					["ib"] = { query = "@code_cell.inner", desc = "in block" },
					["ab"] = { query = "@code_cell.outer", desc = "around block" },
				},
			},
			swap = { -- Swap only works with code blocks that are under the same
				-- markdown header
				enable = true,
				swap_next = {
					--- ... other keymap
					["<leader>sbl"] = "@code_cell.outer",
				},
				swap_previous = {
					--- ... other keymap
					["<leader>sbh"] = "@code_cell.outer",
				},
			},
		},
	},
}
