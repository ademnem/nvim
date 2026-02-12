return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local rose_pine = require("lualine.themes.rose-pine")
		rose_pine.normal.c.fg = ""
		-- Extend terminal here after you figure out what color you want (lime green?)
		-- rose_pine.terminal = rose_pine.normal
		-- rose_pine.terminal.c.bg = "#000000"

		require("lualine").setup({
			options = {
				theme = rose_pine,
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { right = "" } },
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
						colored = false,
					},
					"filename",
				},
				lualine_c = {
					{
						"branch",
						icon = { "" },
						colored = false,
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = false,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = {},
				lualine_z = {
					{ "location", separator = { left = "" }, icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = { "toggleterm", "trouble" },
		})
	end,
}
