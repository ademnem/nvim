local lsp_configs = {}
for _, f in pairs(vim.api.nvim_get_runtime_file('lua/ademnem/lspconfig/*.lua', true)) do
	local server_name = vim.fn.fnamemodify(f, ':t:r')
	vim.lsp.config[server_name] = dofile(f)
	table.insert(lsp_configs, server_name)
end

vim.lsp.enable(lsp_configs)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
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
		map("<leader>gl", function() vim.diagnostic.open_float() end, "[G]oto Diagnostics [L]ist")

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting') then
			vim.diagnostic.config({ virtual_text = true })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
