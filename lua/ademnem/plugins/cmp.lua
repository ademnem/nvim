return {
	"saghen/blink.cmp",
	dependencies = {
		"lazydev.nvim",
		{ "rafamadriz/friendly-snippets" },
	},
	event = "VimEnter",
	version = "1.*",

	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
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
			documentation = { auto_show = false },
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

		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true },
	},
}
