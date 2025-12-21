local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
	on_attach = on
})
require("neo-tree").setup({
    window = {
        mappings = {
            ["<C-B>"] = function() vim.cmd("!sh run.sh") end,
        },
    },
})

