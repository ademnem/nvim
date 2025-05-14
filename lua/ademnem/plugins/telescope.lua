return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		build = ":TSUpdate",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		keys = {
			{ "<leader>pf", require("telescope.builtin").find_files, desc = "[P]roject [F]ind" },
			{
				"<leader>pn",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "[P]roject [N]vim",
			},
			{ "<leader>ps", require("telescope.builtin").live_grep, desc = "[P]roject [S]earch" },
			{ "<leader>ff", require("telescope.builtin").current_buffer_fuzzy_find, desc = "[F]uzzy [F]ind" },
			{ "<leader>pg", require("telescope.builtin").git_files, desc = "search for files tracked by git" },
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
}
