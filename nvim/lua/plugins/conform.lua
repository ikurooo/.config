local opts = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		java = { "google-java-format" },
	},
}

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup(opts)
	end,
}
