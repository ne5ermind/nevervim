return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo tree" },
	},
	init = function()
		vim.g.undotree_SplitWidth = 30
		vim.g.undotree_WindowLayout = 3
	end,
}
