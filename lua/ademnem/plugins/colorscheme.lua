return {
    {
        "rose-pine/neovim",
        as = "rose-pine",
        lazy = false,
        priority = 1000, -- default priority is 50
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    },
}
