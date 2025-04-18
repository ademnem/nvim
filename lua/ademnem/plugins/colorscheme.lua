return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- default priority is 50
		opts = function()
			local opts = {}
			vim.cmd("colorscheme rose-pine")
			return opts
		end,
	},
}
