vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

local function format()
	local bufnr = vim.api.nvim_get_current_buf()
	require("conform").format({ bufnr = bufnr })
end

vim.keymap.set("n", "<leader>fm", format)
