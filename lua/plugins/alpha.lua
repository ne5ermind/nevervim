return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		_Gopts = {
			position = "center",
			hl = "White",
			wrap = "overflow",
		}

		-- DASHBOARD HEADER
		local logo = [[










			░▒▓███████▓▒░░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░
			░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
			░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       ░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
			░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░  ░▒▓█▓▒▒▓█▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░ ░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
			░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
			░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
			░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░  ░▒▓██▓▒░  ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
      ]]

		local utils = require("alpha.utils")

		local header_val = vim.split(logo, "\n")

		dashboard.section.header.val = header_val
		dashboard.section.header.opts.hl = "White"

		local init_path = vim.fn.stdpath("config")
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "  Find file", ":cd $HOME/ | Telescope find_files<CR>"),
			dashboard.button("r", "󰄉  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("w", "  Find Word", ":Telescope live_grep<CR>"),
			dashboard.button("t", "  Typing practice", ":Typr<CR>"),
			dashboard.button("u", " Typing stats", ":TyprStats<CR>"),
			dashboard.button("e", " Enable hardtime", ":Hardtime enable<CR>"),
			dashboard.button("d", "󰇵 Disable hardtime", ":Hardtime disable<CR>"),
			dashboard.button("z", "󰒲  Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("s", "  Settings", ":cd " .. init_path .. "<CR>:e init.lua<CR>"),
			dashboard.button("q", "󰿅  Quit", "<cmd>q<CR>"),
		}

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "White"
			button.opts.hl_shortcut = "White"
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			desc = "Add Alpha dashboard footer",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = {
					" ",
					" ",
					" ",
					" Loaded " .. stats.count .. " plugins  in " .. ms .. " ms ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
					" ",
				}
				dashboard.section.footer.opts.hl = "White"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		local group = vim.api.nvim_create_augroup("CleanDashboard", {})

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "AlphaReady",
			callback = function()
				vim.opt.showtabline = 0
				vim.opt.laststatus = 0
				vim.opt.cmdheight = 0
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			group = group,
			pattern = "<buffer>",
			callback = function()
				vim.opt.showtabline = 2
				vim.opt.laststatus = 2
				vim.opt.cmdheight = 1
			end,
		})
		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
