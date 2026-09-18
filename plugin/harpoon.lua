vim.pack.add({
	{
		src = "https://github.com/nvim-lua/plenary.nvim",
		name = "plenary.nvim",
	},
	{
		src = "https://github.com/theprimeagen/harpoon",
		name = "harpoon",
	},
})

vim.keymap.set("n", "<leader>hl", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "[H]arpoon [L]ist" })

vim.keymap.set("n", "<leader>ha", function()
	require("harpoon.mark").add_file()
end, { desc = "[H]arpoon [A]dd" })

vim.keymap.set("n", "<leader>h1", function()
	require("harpoon.ui").nav_file(1)
end, { desc = "[H]arpoon 1" })

vim.keymap.set("n", "<leader>h2", function()
	require("harpoon.ui").nav_file(2)
end, { desc = "[H]arpoon 2" })

vim.keymap.set("n", "<leader>h3", function()
	require("harpoon.ui").nav_file(3)
end, { desc = "[H]arpoon 3" })

vim.keymap.set("n", "<leader>h4", function()
	require("harpoon.ui").nav_file(4)
end, { desc = "[H]arpoon 4" })

vim.keymap.set("n", "<leader>h5", function()
	require("harpoon.ui").nav_file(5)
end, { desc = "[H]arpoon 5" })
