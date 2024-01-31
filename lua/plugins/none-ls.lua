-- file formatting and linting

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatter
				null_ls.builtins.formatting.prettier, -- JS prettier
				null_ls.builtins.diagnostics.eslint_d, -- JS lintter
			  null_ls.builtins.formatting.rustfmt, -- Rust formatter
      },
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
