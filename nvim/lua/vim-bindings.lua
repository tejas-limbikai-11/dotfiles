vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.cmd("set smartindent")
vim.cmd("set autoindent")

vim.keymap.set("n", "<C-l>", "20zl", { desc = "Scroll right" })

vim.keymap.set("n", "<C-h>", "20zh", { desc = "Scroll left" })

-- Copy Selected Text to Clipboard in Visual Mode
vim.keymap.set("v", "<leader>cc", '"+y', { desc = "Copy selected text to clipboard" })

-- Copy Entire Page to Clipboard in Normal and Visual Modes
vim.keymap.set("n", "<leader>cp", ":%y+<CR>", { desc = "Copy entire page to clipboard" })
vim.keymap.set("v", "<leader>cp", "<ESC>:%y+<CR>", { desc = "Copy entire page to clipboard" })

-- Obsidian
vim.keymap.set("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", { desc = "Obsidian Check Checkbox" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

-- Leetcode.nvim Keybindings
vim.keymap.set("n", "<leader>le", "<cmd>Leet exit<CR>", { desc = "Leetcode Exit" })
vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<CR>", { desc = "Leetcode Open Console" })
vim.keymap.set("n", "<leader>li", "<cmd>Leet info<CR>", { desc = "Leetcode Info" })
vim.keymap.set("n", "<leader>lt", "<cmd>Leet tabs<CR>", { desc = "Leetcode Tabs" })
vim.keymap.set("n", "<leader>ll", "<cmd>Leet list<CR>", { desc = "Leetcode List Problems" })
vim.keymap.set("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "Leetcode Run" })
vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "Leetcode Submit Solution" })
vim.keymap.set("n", "<leader>lo", "<cmd>Leet open<CR>", { desc = "Leetcode Open Problem" })
vim.keymap.set("n", "<leader>lx", "<cmd>Leet reset<CR>", { desc = "Leetcode Reset Code" })
vim.keymap.set("n", "<leader>ld", "<cmd>Leet desc<CR>", { desc = "Leetcode Problem Description" })


