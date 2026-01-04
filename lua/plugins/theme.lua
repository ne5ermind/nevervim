return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("cyberdream").setup({
			variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

			-- Enable transparent background
			transparent = true,

			-- Reduce the overall saturation of colours for a more muted look
			saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

			-- Enable italics comments
			italic_comments = false,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = true,

			-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
			borderless_pickers = false,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
			cache = false,

			-- Override colors
			colors = {
				-- For a list of colors see `lua/cyberdream/colours.lua`

				-- Override colors for both light and dark variants
				bg = "#000000",
				green = "#00ff00",

				-- If you want to override colors for light or dark variants only, use the following format:
				dark = {
					magenta = "#ff00ff",
					fg = "#eeeeee",
				},
				light = {
					red = "#ff5c57",
					cyan = "#5ef1ff",
				},
			},

			-- Disable or enable colorscheme extensions
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
