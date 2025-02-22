return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
        -- { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
        { "<leader><Tab>", ":Neotree toggle left<CR>",  silent = true, desc = "Left File Explorer" },
        { "<leader>n",     ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    },
    config = function()
        require("neo-tree").setup({
            enable_git_status = true,
            enable_modified_markers = true,
            enable_diagnostics = true,
            sort_case_insensitive = true,
            default_component_configs = {
                indent = {
                    with_markers = true,
                    with_expanders = true,
                },
                modified = {
                    symbol = " ",
                    highlight = "NeoTreeModified",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "",
                        deleted = "",
                        modified = "",
                        renamed = "",
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            commands = {
                switch_to_filesystem = function()
                    vim.cmd("Neotree focus filesystem")
                end,
                switch_to_buffers = function()
                    vim.cmd("Neotree focus buffers")
                end,
                switch_to_git = function()
                    vim.cmd("Neotree focus git_status")
                end,
            },
            window = {
                position = "float",
                width = 35,
                mappings = {
                    ["h"] = "close_node", -- Collapse the current folder
                    ["l"] = "open", -- Expand the current folder
                    ["<Tab>"] = "preview",
                    ["1"] = "switch_to_filesystem",
                    ["2"] = "switch_to_buffers",
                    ["3"] = "switch_to_git",
                },
                follow_current_file = { -- Add this block here
                    enabled = true,
                    leave_dirs_open = true,
                },
            },
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
                    -- hide_dotfiles = false,
                    -- hide_gitignored = false,
                    -- hide_by_name = {
                    --     "node_modules",
                    -- },
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
            },
            source_selector = {
                winbar = true,
                sources = {
                    { source = "filesystem", display_name = "   Files " },
                    { source = "buffers", display_name = "   Buffers " },
                    { source = "git_status", display_name = "   Git " },
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd("wincmd =")
                        end
                    end,
                },
            },
        })
    end,
}
