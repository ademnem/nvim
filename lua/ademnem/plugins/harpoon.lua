return {

	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>hm",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "[H]arpoon [M]enu",
		},
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "[H]arpoon [A]dd",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "[H]arpoon 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "[H]arpoon 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "[H]arpoon 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "[H]arpoon 4",
		},
		{
			"<leader>hp",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "[H]arpoon [P]rev",
		},
		{
			"<leader>hn",
			function()
				require("harpoon"):list():next()
			end,
			desc = "[H]arpoon [N]ext",
		},
	},
	opts = {},
}
