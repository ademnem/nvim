return {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			lua = { "selene" },
		},
		linters = {
			selene = {
				condition = function(ctx)
					local config = vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
					return config
				end,
			},
		},
	},
	config = function(_, opts)
		local lint = require("lint")

		lint.linters_by_ft = opts.linters_by_ft

		for name, linter in pairs(opts.linters) do
			lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
		end

		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

--[[
return { "mfussenegger/nvim-lint",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			lua = { "selene", "luacheck" },
		},
		linters = {
			selene = {
				condition = function(ctx)
					return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
				end,
			},
			luacheck = {
				condition = function(ctx)
					return vim.fs.find({ ".luacheckrc" }, { path = ctx.filename, upward = true })[1]
				end,
			},
		},
	},
	config = function(_, opts)
		local registry = require("mason-registry")
		local Package = require("mason-core.package")
		for _, linters in pairs(lint.linters_by_ft) do
			for _, l in ipairs(linters) do
				local package_name, version = Package.Parse(l)
				local pkg = registry.get_package(package_name)
				if not pkg:is_installed() then
					pkg:install({ version = version })
				end
			end
		end

		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		vim.api.nvim_create_autocmd(opts.events, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
]]
--
