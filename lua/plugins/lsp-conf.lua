-- language servers

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- lua server, mainly for editing this config
					"tsserver", -- javascript
					"rust_analyzer", -- rust
					"gopls", -- Go
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconf = require("lspconfig")
      local util = require "lspconfig/util"

			lspconf.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconf.tsserver.setup({
				capabilities = capabilities,
			})
			lspconf.gopls.setup({
				capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gR", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
