return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- default priority is 50
		config = function()
			require("rose-pine").setup({
				transparent = true,
				overrides = function(colors)
					return {
						["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
						["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
						["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
						["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
						["@markup.list.markdown"] = { link = "Function" }, -- + list
						["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
						["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
					}
				end,
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
