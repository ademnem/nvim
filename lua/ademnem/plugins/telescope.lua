return
{
    {
	    'nvim-telescope/telescope.nvim',
	    tag = '0.1.8',
        build = ':TSUpdate',
        dependencies = { 'nvim-lua/plenary.nvim' },
	    lazy = false,
        keys = {
            { '<leader>ds', require('telescope.builtin').find_files, desc = 'directory search' },
            { '<leader>ws', require('telescope.builtin').live_grep, desc = 'word search (using ripgrep)' },
            { '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find, desc = 'fuzzy find in current buffer' },
            { '<leader>gf', require('telescope.builtin').git_files, desc = 'search for files tracked by git' },
        },
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
}
