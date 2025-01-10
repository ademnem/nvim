local builtin = require('telescope.builtin')

return
{
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = false,
    keys = {
        { '<leader>pf', builtin.find_files, desc = 'telescope project find files' },
        { '<leader>gf', builtin.git_files, desc = 'git file search' },
        { '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end, desc = 'ripgrep' },
    },
}
