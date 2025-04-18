return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = false,
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ timeout_ms = 500 })
			end,
			mode = { "n", "v" },
			desc = "format buffer",
		},
	},
	opts = function()
		local opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 300,
				lsp_format = "fallback",
			},
		}

		local registry = require("mason-registry")
		local Package = require("mason-core.package")
		for _, formatters in pairs(opts.formatters_by_ft) do
			for _, f in ipairs(formatters) do
				local package_name, version = Package.Parse(f)
				local pkg = registry.get_package(package_name)
				if not pkg:is_installed() then
					pkg:install({ version = version })
				end
			end
		end

		return opts
	end,
}
