vim.pack.add({
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		name = "telescope.nvim",
	},
	{
		src = "https://github.com/nvim-lua/plenary.nvim",
		name = "plenary.nvim",
	},
	{
		src = "https://github.com/nvim-telescope/telescope-ui-select.nvim",
		name = "telescope-ui-select.nvim",
	},
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		name = "telescope-fzf-native.nvim",
		build = function()
			vim.system({ "make" })
		end,
	},
})

require("telescope").setup({
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]roject [F]ind" })
vim.keymap.set("n", "<leader>pn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[P]roject [N]vim" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "[P]roject [S]earch" })
vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, { desc = "[F]uzzy [F]ind" })
vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Search for files tracked by Git" })

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
