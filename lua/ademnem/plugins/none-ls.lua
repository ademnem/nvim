return {}
--[[
return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    dependencies = { "mason.nvim" },
    keys = {
        { "<leader>nf", vim.lsp.buf.format, desc = "format for builtin lspclient in neovim" },
    },
    config = function()
        -- insert formatters and linters you want here
        local formatters = {
            "stylua", -- lua
        }
        local linters = {
            --	"selene", -- lua
        }

        local registry = require("mason-registry")
        local Package = require("mason-core.package")
        local function download_pkgs(pkg_specifiers)
            for _, pkg_spec in ipairs(pkg_specifiers) do
                local package_name, version = Package.Parse(pkg_spec)
                local pkg = registry.get_package(package_name)
                if not pkg:is_installed() then
                    pkg:install({ version = version })
                end
            end
        end
        -- uninstall all unused?
        download_pkgs(formatters)
        download_pkgs(linters)

        local null_ls = require("null-ls")
        local sources = {}
        --@param s table
        --@param type string
        --@param pkgs table
        local function build_sources(s, type, pkgs)
            for _, p in ipairs(pkgs) do
                table.insert(s, null_ls.builtins[type][p])
            end
        end
        build_sources(sources, "formatting", formatters)
        build_sources(sources, "diagnostics", linters)

        null_ls.setup({ sources = sources })
    end,
}
]]--
