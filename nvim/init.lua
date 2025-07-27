vim.g.mapleader = " "
vim.cmd('set rnu!')
vim.cmd('set nu!')
vim.keymap.set('n', '<C-u>', ':NvimTreeToggle<CR>')
require("config.lazy")
