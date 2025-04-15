return
{
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = false,
    keys = {
        { '<leader>pf', require('telescope.builtin').find_files, desc = 'telescope project find files' },
        { '<leader>gf', require('telescope.builtin').git_files, desc = 'git file search' },
        { '<leader>ps', function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }); end, desc = 'ripgrep' },
    },
}
