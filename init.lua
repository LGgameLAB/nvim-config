require('config.lazy')
require('config.keymaps')


-- Options
vim.opt.relativenumber = true
vim.opt.autochdir = true
-- vim.cmd([[Neotree]])

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("neo-tree").setup({
			open_files_do_not_replace_types = { "terminal", "nofile" },
			filesystem = {
				follow_current_file = {
					enabled = true,
				}, -- Keep Neo-tree focused on the current file
				use_libuv_file_watcher = true, -- Automatically update tree
			}
		})
		-- Open Neo-tree and focus on the current file
		vim.cmd("Neotree show filesystem position=left reveal")
 	 end,
})
