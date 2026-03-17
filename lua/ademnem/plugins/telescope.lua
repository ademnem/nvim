return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		event = "VimEnter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim", -- uses fzf to find
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" }, -- better picker for code actions
			{ "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
		},
		lazy = false,
		keys = {
			{ "<leader>pf", require("telescope.builtin").find_files,                desc = "[P]roject [F]ind" },
			{
				"<leader>pn",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "[P]roject [N]vim",
			},
			{ "<leader>ps", require("telescope.builtin").live_grep,                 desc = "[P]roject [S]earch" },
			{ "<leader>ff", require("telescope.builtin").current_buffer_fuzzy_find, desc = "[F]uzzy [F]ind" },
			{
				"<leader>pg",
				require("telescope.builtin").git_files,
				desc = "search for files tracked by git",
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown() },
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
		end,
	},
}
