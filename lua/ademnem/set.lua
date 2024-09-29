-- Set Options File

local set = vim.opt


-- Cursor
set.guicursor = ""


-- Line Numbers
set.nu = true
set.relativenumber = true  


-- Line Wrap
set.wrap = false


-- Tabs and Indentations
set.shiftwidth = 4 -- spaces per tab (when shifting)
set.tabstop = 4 -- spaces per tab
set.softtabstop = 4 
set.expandtab = true
set.smartindent = true


-- Screen Splits
set.splitbelow = true -- open horizontal splits below current window
set.splitright = true -- open vertical splits to the right of the current window


-- Undos and Backups
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true


-- Search Files
set.hlsearch = false
set.incsearch = true


-- Colors
set.termguicolors = true


-- Fast Update Time
set.updatetime = 50

