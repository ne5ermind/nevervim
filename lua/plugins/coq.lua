return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	build = ":COQdeps",
	lazy = false,
	excluded_ft = { "alpha", "typr" },
	init = function()
		vim.g.coq_settings = {
			auto_start = "shut-up",
		}
	end,
}
