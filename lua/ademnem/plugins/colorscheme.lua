function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	
	-- For transparent background, need a transparent terminal for this
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


return 
{	
    { 
		"rose-pine/neovim",
		as = "rose-pine",
		lazy = false,	-- make sure to lwad this during startup if it is in the main colorscheme
		priority = 1000, -- make sure to load this before all other start plugins
		config = function()
			-- load colorscheme here
			vim.cmd([[colorscheme rose-pine]])
            
            -- ColorMyPencils()
		end
    },	
}


