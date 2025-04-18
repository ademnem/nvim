return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		},

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}
