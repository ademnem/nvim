require("options")
require("remap")

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		local data = event.data or {}

		-- if update command is needed
		local on_update = vim.tbl_get(data, "spec", "data", "on_update")
		if type(on_update) == "function" then
			vim.schedule(on_update)
		end

		-- if an extra build step is needed
		local build = vim.tbl_get(data, "spec", "build")
		local path = vim.tbl_get(data, "path")
		if type(build) == "function" and path then
			vim.fn.chdir(path)
			build()
		end
	end,
})
