return {
	"nvimtools/none-ls.nvim",
	dependencies = { "mason.nvim" },
	keys = {
		{ "<leader>nf", vim.lsp.buf.format, desc = "format for builtin lspclient in neovim" },
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
