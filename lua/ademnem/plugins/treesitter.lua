return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",  -- "main" is different from "master" for this plugin, "main" is the rewrite and more recent
	lazy = false,
	build = ":TSUpdate", -- does not support lazy loading
	config = function()
		local ensure_installed = {
			"cpp",
			"latex",
			"nix",
			"python",
			"rust",
		}
		local treesitter = require("nvim-treesitter")

		-- Makes sure we install is called on languages that aren't installed already
		local langs = {}
		for _, lang in ipairs(ensure_installed) do
			if not vim.tbl_contains(treesitter.get_installed(), lang) then
				table.insert(langs, lang)
			end
		end
		treesitter.install(langs)

		-- Activates treesitter for each installed language
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				if vim.list_contains(treesitter.get_installed(), args.match) then
					-- syntax highlighting, provided by Neovim
					vim.treesitter.start()
					-- folds, provided by Neovim (kinda weird ngl)
					-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					-- vim.wo.foldmethod = "expr"
					-- indentation, provided by nvim-treesitter
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})

		-- Incremental Selection
		-- builtin to neovim, checkout ":h treesitter-defaults" to see default mappings
		local select = require("vim.treesitter._select")

		vim.keymap.set({ "n", "x" }, "<Enter>", function()
			if vim.treesitter.get_parser(nil, nil, { error = false }) then
				select.select_parent(vim.v.count1)
			else
				vim.lsp.buf.selection_range(vim.v.count1)
			end
		end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

		vim.keymap.set({ "n", "x" }, "<Backspace>", function()
			if vim.treesitter.get_parser(nil, nil, { error = false }) then
				select.select_child(vim.v.count1)
			else
				vim.lsp.buf.selection_range(-vim.v.count1)
			end
		end, { desc = "Select child treesitter node or inner incremental lsp selections" })
	end,
}
