local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.debug"), -- barebones debugging tools, needs configuring
	require("plugins.indent_line"), -- better indentation
	require("plugins.autopairs"), -- take a wild guess
	require("plugins.neo-tree"), -- file tree
	require("plugins.gitsigns"), -- git indicators and keymaps
	require("plugins.undotree"), -- useful tool for working with local hostory of a file
	require("plugins.satellite"), -- interactive scrollbar
	require("plugins.treesitter"), -- code highlighting
	require("plugins.conform"), -- autoformat
	-- require("plugins.coq"), -- powerful tool for autocompletion
    require("plugins.cmp"), -- autoccmp
	require("plugins.theme"), -- theme
	require("plugins.mini"), -- better textobjects
	require("plugins.guess-indent"), -- better indentation
	require("plugins.neocolumn"), -- indicator for long lines of code
	require("plugins.barbar"), -- buffer bar
	require("plugins.alpha"), -- starting screen
	require("plugins.which-key"), -- useful tool for remembering tey combinations
	require("plugins.telescope"), -- fuzzy finder
	require("plugins.typr"), -- typing practice
	require("plugins.hardtime"), -- optional plugin for easier nvim motion learning
	require("plugins.floatterm"), -- floating terminal

	-- support for md, qmd and ipynb files (sort of)
	require("plugins.quatro"),
	require("plugins.jupytext"),
	require("plugins.molten"),
	require("plugins.image"),
	require("plugins.notebooknavigator"),

	-- LSP config
	require("plugins.lazydev"),
	require("plugins.lsp"),
	require("plugins.lint"),
}, {
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
