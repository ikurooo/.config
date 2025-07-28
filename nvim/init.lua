vim.g.mapleader = " "
vim.cmd('set rnu!')
vim.cmd('set nu!')
vim.keymap.set('n', '<C-u>', ':NvimTreeToggle<CR>')
require("config.lazy")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

