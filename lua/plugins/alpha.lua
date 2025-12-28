return {
	"goolord/alpha-nvim",
	config = function()
		local present, alpha = pcall(require, "alpha")

		if not present then
			return
		end

		local header = {
			type = "text",
			val = {
				"",
				"",
				"░▒▓███████▓▒░░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░  ",
				"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
				"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
				"░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░  ░▒▓█▓▒▒▓█▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░ ░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
				"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
				"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
				"░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░  ░▒▓██▓▒░  ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
				"",
				"",
			},
			opts = {
				position = "center",
				hl = "AlphaHeader",
			},
		}

		local handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/lazy" | head -n -2 | wc -l | tr -d "\n" ')
		local plugins = handle:read("*a")
		handle:close()

		local plugin_count = {
			type = "text",
			val = {
				"└─    by ne5ermind    ─┘",
				"",
				"",
				"",
			},
			opts = {
				position = "center",
				hl = "AlphaHeader",
			},
		}

		local heading = {
			type = "text",
			val = { "", "┌─ NVIM configuration ─┐" },
			opts = {
				position = "center",
				hl = "AlphaHeader",
			},
		}

		local footer = {
			type = "text",
			val = "owo",
			opts = {
				position = "center",
				hl = "AlphaFooter",
			},
		}

		local function button(sc, txt, keybind)
			local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

			local opts = {
				position = "center",
				text = txt,
				shortcut = sc,
				cursor = 5,
				width = 24,
				align_shortcut = "right",
				hl_shortcut = "AlphaHeader",
				hl = "AlphaHeader",
			}
			if keybind then
				opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
			end

			return {
				type = "button",
				val = txt,
				on_press = function()
					local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
					vim.api.nvim_feedkeys(key, "normal", false)
				end,
				opts = opts,
			}
		end

		local buttons = {
			type = "group",
			val = {
				button("f", "    Find file", ":cd $HOME/ | Telescope find_files<CR>"),
				button("r", "    Recent", ":Telescope oldfiles<CR>"),
				button("w", "    Find Word", ":Telescope live_grep<CR>"),
			},
			opts = {
				spacing = 1,
			},
		}

		local section = {
			header = header,
			buttons = buttons,
			plugin_count = plugin_count,
			heading = heading,
			footer = footer,
		}

		local opts = {
			layout = {
				{ type = "padding", val = 1 },
				section.header,
				{ type = "padding", val = 1 },
				section.heading,
				section.plugin_count,
				{ type = "padding", val = 1 },
				-- section.top_bar,
				section.buttons,
				-- section.bot_bar,
				{ type = "padding", val = 1 },
				section.footer,
			},
			opts = {
				margin = 5,
			},
		}
		alpha.setup(opts)

		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ffffff", bg = "NONE" })
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#ffffff", bg = "NONE" })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#ffffff", bg = "NONE" })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#ffffff", bg = "NONE" })
		vim.api.nvim_set_hl(0, "AlphaHeaderChar", { fg = "#ffffff", bg = "NONE" })

		local startify_group = vim.api.nvim_create_augroup("AlphaUI", { clear = true })

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			group = startify_group,
			callback = function()
				vim.opt.laststatus = 0
				vim.opt.showtabline = 0
				vim.opt.cmdheight = 0
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaClosed",
			group = startify_group,
			callback = function()
				vim.opt.laststatus = 2
				vim.opt.showtabline = 2
				vim.opt.cmdheight = 1
			end,
		})
	end,
}
