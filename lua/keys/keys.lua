local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- disable search highlights
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" }) -- showing diagnostics
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- exiting terminals quickly
vim.keymap.set("n", "F", ":?", { desc = "enter search mode" }) -- enter search mode

-- moving windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- moving lines up // down // left // right
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection " })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines down in visual selection " })
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- navigating search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

-- Navigating autoocmpletion buffer with Alt
vim.keymap.set("i", "<A-j>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	else
		return "<Down>"
	end
end, { expr = true, noremap = true, silent = true })

-- Run code in a floating window
vim.keymap.set("n", "<leader>rk", function()
	vim.cmd("write")

	local filepath = vim.fn.expand("%:p")
	if filepath == "" or not vim.fn.filereadable(filepath) then
		vim.notify("File not saved", vim.log.levels.ERROR)
		return
	end

	local filename = vim.fn.expand("%:t")
	local safe_path = vim.fn.shellescape(filepath)
	local kitty = "/usr/bin/kitty"

	local cmd_str = "tput clear 2>/dev/null; "
		.. "echo 'Executing: "
		.. filename
		.. "'; "
		.. "echo '----------------------'; "
		.. "exec bash --norc -c 'time "
		.. (vim.bo.filetype == "python" and "python3 " or vim.bo.filetype == "javascript" and "node " or (vim.env.SHELL or "/bin/bash") .. " ")
		.. safe_path
		.. "'"

	vim.fn.jobstart({ kitty, "--hold", "--class", "KittyRunner", "bash", "--norc", "-c", cmd_str })
end, { desc = "Run code in Kitty" })

-- navigating autocmp results
vim.keymap.set("i", "<A-k>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	else
		return "<Up>"
	end
end, { expr = true, noremap = true, silent = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.keymap.set("i", "<Tab>", function()
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys("\14\25", "n")
			else
				return "<Tab>"
			end
		end, { expr = true, noremap = true, silent = true })
	end,
	once = true,
})

-- Molten keymaps

vim.keymap.set("n", "<localleader>ip", function()
	local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
	if venv ~= nil then
		-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
		venv = string.match(venv, "/.+/(.+)")
		vim.cmd(("MoltenInit %s"):format(venv))
	else
		vim.cmd("MoltenInit python3")
	end
end, { desc = "Initialize Molten for python3", silent = true })

vim.keymap.set(
	"n",
	"<localleader>os",
	":noautocmd MoltenEnterOutput<CR>",
	{ desc = "open output window", silent = true }
)

vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })

vim.keymap.set(
	"v",
	"<localleader>r",
	":<C-u>MoltenEvaluateVisual<CR>gv",
	{ desc = "execute visual selection", silent = true }
)

vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })

vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- if you work with html outputs:
vim.keymap.set("n", "<localleader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })

vim.keymap.set("n", "<localleader>ip", function()
	local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
	if venv ~= nil then
		-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
		venv = string.match(venv, "/.+/(.+)")
		vim.cmd(("MoltenInit %s"):format(venv))
	else
		vim.cmd("MoltenInit python3")
	end
end, { desc = "Initialize Molten for python3", silent = true })

-- Interrupt the kernel
vim.keymap.set("n", "<leader>z", ":MoltenInterrupt<CR>", { desc = "Interrupt the molten kernel" })

-- Manual treesitter start
vim.keymap.set("n", "<leader>tss", function()
	vim.treesitter.start()
end, { desc = "Manually start treesitter" })

vim.keymap.set("n", "<leader>to", "<cmd>FloatermToggle<CR>", { desc = "Open a floating terminal window" })
