return {
	"folke/lazydev.nvim",
	ft = { "lua", "python" },
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
