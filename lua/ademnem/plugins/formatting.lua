return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			python = { "ruff" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
	},
}
