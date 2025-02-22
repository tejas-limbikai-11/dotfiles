return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "echasnovski/mini.icons", lazy = false },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("oil").setup({
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
			  show_hidden = true,
			  -- natural_order = true,
			  -- is_always_hidden = function(name, _)
			  --   return name == ".." or name == ".git"
			  -- end,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0,
			},
			win_options = {
				-- wrap = true,
				winblend = 0,
			},
			keymaps = {
				["<C-c>"] = false,
				["q"] = "actions.close",
                ["<Esc>"] = "actions.parent",
			},
		})
		-- vim.keymap.set("n", "<leader>e", require("oil").toggle_float, { desc = "Toggle Oil Floating Window" })
	end,
	lazy = false,
}
