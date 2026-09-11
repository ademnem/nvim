vim.pack.add({
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
	keymap = {
		["<Up>"] = {},
		["<Down>"] = {},
		["<C-n>"] = {},
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-l>"] = { "select_and_accept", "fallback" },
		-- <C-space> shows documentation of completion
	},

	appearance = {
		nerd_font_variant = "normal",
	},

	completion = {
		list = { max_items = 3 },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	sources = {
		default = { "buffer", "lsp", "path", "snippets" },
		providers = {
			buffer = {
				min_keyword_length = 0,
				score_offset = 4,
			},
			lsp = {
				min_keyword_length = 1,
				score_offset = 3,
			},
			path = {
				min_keyword_length = 2,
				score_offset = 2,
			},
			snippets = {
				min_keyword_length = 3,
				score_offset = 1,
			},
		},
	},

	signature = { enabled = true },
})
