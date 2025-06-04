-- Set Options File

-- Visuals
vim.opt.guicursor = "n:blinkon0"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.showmode = true -- show editor mode in command line
vim.opt.cmdheight = 0 -- height of command line
vim.opt.signcolumn = "yes" -- signcolumn is on by default
vim.opt.scrolloff = 6 -- min lines to keep above and below cursor

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Line Wrap
vim.opt.wrap = false
vim.api.nvim_create_user_command("ToggleTextWrap", function()
	vim.wo.wrap = not vim.wo.wrap
	print("TextWrap = " .. (vim.wo.wrap and "ON" or "OFF"))
end, {})

-- Tabs and Indentations
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- spaces per tab (when shifting)
vim.opt.tabstop = 4 -- spaces shown per tab
vim.opt.softtabstop = 4 -- space applied per tab
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- keep indentation from previous line
vim.opt.breakindent = true

-- Screen Splits
vim.opt.splitbelow = true -- open horizontal splits below current window
vim.opt.splitright = true -- open vertical splits to the right of the current window

-- Undos and Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- stores undos between sessions

-- Search Files
vim.opt.hlsearch = false -- highlight all matches of a search
vim.opt.incsearch = true -- show where the pattern is while typing
vim.opt.ignorecase = true -- ignore casing
vim.opt.smartcase = true -- ignore ignorecase if uppercase letters are typed

-- Fast Update Time
vim.opt.updatetime = 50

-- Remove New Line Comments
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	callback = function()
		vim.o.showtabline = 0
	end,
	desc = "Disable Tabline",
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable New Line Comment",
})
