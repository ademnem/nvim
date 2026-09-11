return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			runtime = {
				version = "LuaJIT",
				library = { vim.env.VIMRUNTIME },
			},
			format = {
				defaultConfig = {
					indent_size = 4,
					quote_style = "AutoPreferDouble",
					max_line_length = 125,
				},
			},
		},
		signatureHelp = { enabled = true },
	},
}
