return {
	cmd = { "stylua", "--search-parent-directories", "--respect-ignores", "--lsp" },
	filetypes = { "lua", "luau" },
	root_markers = { ".stylua.toml", "stylua.toml", ".luarc.json", ".luarc.jsonc", ".git" },
	-- settings can be done in luals.lua since the --lsp argument makes it consider lsp configs
}
