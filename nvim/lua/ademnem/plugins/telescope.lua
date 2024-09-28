local builtin = require('telescope.builtin')

return
{
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = false,
    config = function()     
        -- fuzzy finder
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'telescope find files' }) -- project find
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {}) -- git file search
        vim.keymap.set('n', '<leader>ps', function() 
        	builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end) -- ripgrep 
    end,
}
