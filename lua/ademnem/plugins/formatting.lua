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
		-- view ":h conform-formatters" for what to call each
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			python = { "ruff_format", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
		formatters = {
			ruff_format = {
				prepend_args = { "--config", "$HOME/.config/nvim/lua/ademnem/ruff.toml" },
			},
		},
	},
}
