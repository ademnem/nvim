---@diagnostic disable: undefined-doc-name
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

		completion = { documentation = { auto_show = false } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true },
	},
}
