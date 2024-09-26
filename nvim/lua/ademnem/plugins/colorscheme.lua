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
		end,
    },	  
}
