-- https://www.reddit.com/r/neovim/comments/1jnaas9/vimlspconfigs_server_and_client_capabilities/
return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { ".git", "ruff.toml", ".ruff.toml", "pyproject.toml" },
	capabilities = {
		general = {
			positionEncodings = { "utf-16" }, -- because of pyright
		},
	},
	init_options = {
		settings = {
			lineLength = 125,
			showSyntaxErrors = false, -- Redundant (handled by Pyright)
			lint = {
				-- Linter Configuration: These are the linters that I think will be
				-- able to identify most of the code smells. These linters are non-
				-- overlapping with Pyright's linting.
				--
				-- To know more about linters supported by Ruff, execute: ruff linter
				select = { "E", "I", "SIM", "B", "S", "N" },
			},
		},
	},
}
