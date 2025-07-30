-- Prerequisites:
-- yay -S jdtls
-- yay -S java-lombok
-- cp -r /usr/share/java/jdtls/config_linux ~/.cache/jdtls/config_linux

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "ss", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

	-- Java-specific (jdtls) extension
	local jdtls = require("jdtls")
	vim.keymap.set("n", "<C-o>", jdtls.organize_imports, opts)
end

return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					local jdtls = require("jdtls")

					-- Determine root project folder
					local root = vim.fs.root(0, { ".git", "mvnw", "gradlew" })
					if not root then
						return
					end

					local config = {
						cmd = {
							"java",
							"-Declipse.application=org.eclipse.jdt.ls.core.id1",
							"-Dosgi.bundles.defaultStartLevel=4",
							"-Declipse.product=org.eclipse.jdt.ls.core.product",
							"-Dlog.protocol=true",
							"-Dlog.level=ALL",
							"-Xmx1g",
							"--add-modules=ALL-SYSTEM",
							"--add-opens",
							"java.base/java.util=ALL-UNNAMED",
							"--add-opens",
							"java.base/java.lang=ALL-UNNAMED",
							"-javaagent:/usr/share/java/lombok/lombok.jar",
							"-jar",
							"/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250424-1814.jar",
							"-configuration",
							"/home/ivan/.cache/jdtls/config_linux",
							"-data",
							vim.fn.stdpath("cache") .. "/jdtls-workspace",
						},
						root_dir = root,
						settings = {
							java = {},
						},
						init_options = {
							bundles = {},
						},
						on_attach = on_attach,
						signatureHelp = { enabled = true },
					}

					jdtls.start_or_attach(config)
				end,
			})
		end,
	},
}
