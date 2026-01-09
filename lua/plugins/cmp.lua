return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        require("cmp").setup({
            sources = { { name = "nvim_lsp" } },
            mapping = require("cmp").mapping.preset.insert({
                ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
            })
        })

        require("lspconfig").pylsp.setup({})
    end
 }
