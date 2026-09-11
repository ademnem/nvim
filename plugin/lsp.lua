vim.pack.add({
	{ -- automatically configures lsps
		src = "https://github.com/neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
	},
	{ -- lsp package manager
		src = "https://github.com/mason-org/mason.nvim",
		name = "mason.nvim",
	},
	{ -- maps lsps names on nvim-lspconfig to mason.nvim
		src = "https://github.com/mason-org/mason-lspconfig.nvim",
		name = "mason-lspconfig.nvim",
	},
	{
		src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
		name = "mason-tool-installer.nvim",
	},
})
-- for future configurations :help lspconfig-all
local servers = {
	pyright = {}, -- python lsp

	stylua = {}, -- lua formatter
	-- Special Lua Config, as recommended by neovim help docs
	lua_ls = { -- lua lsp
		on_init = function(client)
			client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
			client.config.settings.Lua = vim.tbl_deep_extend("force", current_settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
					--  See https://github.com/neovim/nvim-lspconfig/issues/3189
					library = vim.api.nvim_get_runtime_file("", true),
				},
			})
		end,
		---@type lspconfig.settings.lua_ls
		settings = {
			Lua = {
				format = { enable = false }, -- Disable formatting (formatting is done by stylua)
			},
		},
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		-- from project: kickstart.nvim, file: init.lua
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		local tb = require("telescope.builtin")

		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("<leader>gr", tb.lsp_references, "[G]oto [R]eferences")
		map("<leader>gd", tb.lsp_definitions, "[G]oto [D]efinitions")
		map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration") -- header for C
		map("<leader>gS", tb.lsp_document_symbols, "[G]et [S]ymbols")
		map("<leader>gl", function()
			vim.diagnostic.open_float()
		end, "[G]oto Diagnostics [L]ist")

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.diagnostic.config({ virtual_text = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

require("mason").setup()
require("mason-lspconfig").setup()

-- Ensure the servers and tools above are installed
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	-- You can add other tools here that you want Mason to install
})

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
