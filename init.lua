require('config.lazy')
require('config.config')
require('config.keymaps')


-- Options
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.autochdir = false
-- vim.o.wrap = false
vim.opt.wrap = false
vim.filetype.add({
    extension = {
        vert = "glsl",
        frag = "glsl",
        geom = "glsl",
        glsl = "glsl",
    }
})

-- vim.cmd([[Neotree]])
-- Save on entering Insert
vim.cmd([[autocmd InsertLeave * silent! update]])

