-- https://www.reddit.com/r/neovim/comments/1jnaas9/vimlspconfigs_server_and_client_capabilities/
return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyrightconfig.json", "pyproject.toml", ".git" },
	capabilities = {
		general = {
			positionEncodings = { "utf-16" }, -- because of pyright
		},
	},
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
