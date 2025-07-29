-- ~/.config/nvim/init.lua

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.o.cmdheight = 0

vim.cmd("filetype plugin on")
vim.cmd("set rnu!")
vim.cmd("set nu!")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	signs = true,
	underline = true,
	severity_sort = true,
	float = {
		border = "rounded",
	},
})

require("config.lazy")
require("config.keymap")
