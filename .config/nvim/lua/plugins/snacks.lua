return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			-- Open git log in vertical view
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log({
						finder = "git_log",
						format = "git_log",
						preview = "git_show",
						confirm = "git_checkout",
						layout = "vertical",
					})
				end,
				desc = "Git Log",
			},

			-- -- List git branches with Snacks_picker to quickly switch to a new branch
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches({
						layout = "select",
					})
				end,
				desc = "Git Branches",
			},

			-- lazygit
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},

			{
				"<leader>/",
				function()
					Snacks.picker.keymaps({
						layout = "vertical",
					})
				end,
				desc = "Keymaps",
			},

			-- File picker
			{
				"<leader><space>",
				function()
					Snacks.picker.files({
						finder = "files",
						format = "file",
						show_empty = true,
						supports_live = true,
						-- In case you want to override the layout for this keymap
						-- layout = "vscode",
					})
				end,
				desc = "Find Files",
			},
			-- Navigate my buffers
			{
				"<leader>,",
				function()
					Snacks.picker.buffers({
						-- I always want my buffers picker to start in normal mode
						on_show = function()
							vim.cmd.stopinsert()
						end,
						finder = "buffers",
						format = "buffer",
						hidden = false,
						unloaded = true,
						current = true,
						sort_lastused = true,
						win = {
							input = {
								keys = {
									["d"] = "bufdelete",
								},
							},
							list = { keys = { ["d"] = "bufdelete" } },
						},
						-- In case you want to override the layout for this keymap
						-- layout = "ivy",
					})
				end,
				desc = "[P]Snacks picker buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			{
				"<leader>n",
				function()
					Snacks.picker.explorer({
						auto_close = true,
						layout = {
							preset = "sidebar",
						},
					})
				end,
				desc = "Explorer",
			},
			{
				"<leader>dh",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>gc",
				function()
					Snacks.lazygit.log_file()
				end,
				desc = "Lazygit Current File History",
			},

			{
				"<leader>dn",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},

			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},
			-- Grep
			{
				"<leader>fs",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>su",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undotree",
			},
			{
				"<leader>tt",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			{
				"<leader>sp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>sP",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search for Plugin Spec",
			},
		},
		opts = {
			scroll = { enabled = true },

			explorer = { enabled = true },

			statuscolumn = { enabled = true },

			image = {
				enabled = true,
				doc = {
					-- enable image viewer for documents
					-- a treesitter parser must be available for the enabled languages.
					-- supported language injections: markdown, html
					enabled = true,
					-- render the image inline in the buffer
					-- if your env doesn't support unicode placeholders, this will be disabled
					-- takes precedence over `opts.float` on supported terminals
					inline = true,
					-- render the image in a floating window
					-- only used if `opts.inline` is disabled
					float = true,
					max_width = 80,
					max_height = 40,
				},
			},

			indent = {
				enabled = true,
				animate = {
					enabled = false,
				},
			},
			dashboard = {
				enabled = true,

				-- Simple Dashboard
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},

			picker = {
				debug = {
					scores = false, -- show scores in the list
				},
				layout = {
					preset = "default",
					-- When reaching the bottom of the results in the picker, I don't want
					-- it to cycle and go back to the top
					cycle = false,
				},
				layouts = {
					-- I wanted to modify the ivy layout height and preview pane width,
					-- this is the only way I was able to do it
					-- NOTE: I don't think this is the right way as I'm declaring all the
					-- other values below, if you know a better way, let me know
					--
					-- Then call this layout in the keymaps above
					-- got example from here
					-- https://github.com/folke/snacks.nvim/discussions/468
					ivy = {
						layout = {
							box = "vertical",
							backdrop = false,
							row = -1,
							width = 0,
							height = 0.5,
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
							},
						},
					},
					-- I wanted to modify the layout width
					--
					vertical = {
						layout = {
							backdrop = false,
							width = 0.8,
							min_width = 80,
							height = 0.8,
							min_height = 30,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
						},
					},
				},
				matcher = {
					frecency = true,
				},
				formatters = {
					file = {
						filename_first = true, -- display filename before the file path
					},
				},
				win = {
					input = {
						keys = {
							-- to close the picker on ESC instead of going to normal mode,
							-- add the following keymap to your config
							["<Esc>"] = { "close", mode = { "n", "i" } },
							-- I'm used to scrolling like this in LazyGit
							["J"] = { "preview_scroll_down", mode = { "i", "n" } },
							["K"] = { "preview_scroll_up", mode = { "i", "n" } },
							["H"] = { "preview_scroll_left", mode = { "i", "n" } },
							["L"] = { "preview_scroll_right", mode = { "i", "n" } },
						},
					},
				},
			},
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			notify = { enabled = true },
		},
	},
}
