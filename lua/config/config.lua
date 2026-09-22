-- Pyright is configured in plugins/plugin.lua via vim.lsp.config()/vim.lsp.enable().
-- (Old require("lspconfig").pyright.setup({...}) call removed from here — it was
-- duplicating that setup using the deprecated API.)

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("neo-tree").setup({
			open_files_do_not_replace_types = { "terminal", "nofile" },
			close_if_last_window = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
				}, -- Keep Neo-tree focused on the current file
				use_libuv_file_watcher = true, -- Automatically update tree
				hijack_netrw_behavior = "open_current",
			},
			window = {
				width = 30,
				mappings = {
					["<C-B>"] = function()
						vim.cmd("!sh run.sh")
					end,
				},
			},
		})
		-- Open Neo-tree and focus on the current file
		vim.cmd("Neotree show filesystem position=left reveal")
	end,
})
