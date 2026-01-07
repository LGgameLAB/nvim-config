vim.g.mapleader = " "

function Map(mode, keybind, command, flags)
	flags = flags or {}
	vim.keymap.set(mode, keybind, command, flags)
end

Map("n", "<C-t>", ":tabnext")
Map("n", "<leader>n", ":Neotree<CR>", {silent = true})
Map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
Map("n", "<leader>q", ":qa<CR>", { noremap = true, silent = true })
Map("n", "<leader>t", ":tabnew<CR>", { noremap = true, silent = true })
Map("n", "<leader><Tab>", "<C-^><CR>", { noremap = true, silent = true })
Map("n", "<C-B>", ":!sh run.sh<CR>", { noremap = true, silent = true })
Map("n", "<C-M>", ":Neotree toggle<CR>:Neominimap Toggle<CR><C-w>w", { noremap = true, silent = true })
Map("n", "<C-]>", ">>", { noremap = true})
Map("n", "<C-{>", "<<", { noremap = true})
Map("n", "<Tab>", "<C-w>w", { noremap = true})

-- Move to previous/next buffer
Map("n", "<leader>,", "<Cmd>BufferPrevious<CR>", { silent = true })
Map("n", "<leader>.", "<Cmd>BufferNext<CR>", { silent = true })

-- Re-order buffer
Map("n", "<leader><", "<Cmd>BufferMovePrevious<CR>", { silent = true })
Map("n", "<leader>>", "<Cmd>BufferMoveNext<CR>", { silent = true })

-- Goto buffer in position
Map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", { silent = true })
Map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", { silent = true })
Map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", { silent = true })
Map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", { silent = true })
Map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", { silent = true })
Map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", { silent = true })
Map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", { silent = true })
Map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", { silent = true })
Map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", { silent = true })
Map("n", "<leader>0", "<Cmd>BufferLast<CR>", { silent = true })

