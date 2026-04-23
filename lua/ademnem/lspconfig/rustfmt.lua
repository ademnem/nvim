---Parse the rust edition from the Cargo.toml file
---@param dir string
---@return string?
local parse_rust_edition = function(dir)
	local manifest_files = vim.fs.find("Cargo.toml", { upward = true, path = dir, limit = math.huge })
	for _, manifest in ipairs(manifest_files) do
		for line in io.lines(manifest) do
			-- if a project is part of a workspace, the edition might be defined top-level
			local is_in_workspace = line:match("^edition *= *{ *workspace *= *true *}")
				or line:match("^edition.workspace *= *true")
			local edition = line:match('^edition *= *"(%d+)"')
			if is_in_workspace then
				break
			elseif edition then
				return edition
			end
		end
	end
end

return {
	command = "rustfmt",
	options = {
		default_edition = "2021",
		nightly = false,
	},
	args = function(self, ctx)
		local args = { "--emit=stdout" }
		local edition = parse_rust_edition(ctx.dirname) or self.options.default_edition
		table.insert(args, "--edition=" .. edition)

		if self.options.nightly then
			-- "+nightly" must be the first argument
			table.insert(args, 1, "+nightly")
		end
		return args
	end,
	cwd = function(self, ctx)
		return vim.fs.root(ctx.dirname, {
			"rustfmt.toml",
			".rustfmt.toml",
		})
	end,
}
