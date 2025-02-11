vim.g.mapleader = " "

function Map(mode, keybind, command, flags)
	flags = flags or {}
	vim.keymap.set(mode, keybind, command, flags)
end
--Map("n", "<C-t>", ":Neotree")
Map("n", "<leader>n", ":Neotree<CR>", {silent = true})
Map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
Map("n", "<leader>q", ":qa<CR>", { noremap = true, silent = true })
Map("n", "<leader>t", ":tabnew<CR>", { noremap = true, silent = true })
Map("n", "<leader><Tab>", ":tabn<CR>", { noremap = true, silent = true })
Map("n", "<C-]>", ">>", { noremap = true})
Map("n", "<C-{>", "<<", { noremap = true})
