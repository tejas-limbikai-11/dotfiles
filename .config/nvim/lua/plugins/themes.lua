return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
    {
        "NLKNguyen/papercolor-theme",
        name = "papercolor",
        lazy = false, -- Ensure it's loaded eagerly
        priority = 1000, -- Set a high priority to apply it immediately
        config = function()
            vim.opt.background = "light" -- Use light mode
        end,
    },
}
