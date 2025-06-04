return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		-- trying to expose command line
		-- might need to try noice.nvim
		--[[
		local ns = vim.api.nvim_create_namespace("showcmd_msg")
		local showcmd_msg
		vim.ui_attach(ns, { ext_messages = true }, function(event, ...)
			if event == "msg_showcmd" then
				local content = ...
				showcmd_msg = #content > 0 and content[1][2] or ""
			end
		end)
		]]
		--

		require("lualine").setup({
			options = {
				theme = "rose-pine",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" },
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					--[[
					function()
						return showcmd_msg
					end,
					]]
				},
				lualine_c = {},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
						colored = false,
					},
					"filename",
				},
				lualine_z = {
					{ "location", icon = "" },
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
