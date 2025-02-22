vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.cmd("set smartindent")
vim.cmd("set autoindent")

-- move lines up or down in normal and visual modes
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- move lines up or down 
vim.keymap.set({"n", "v"}, "<C-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set({"n", "v"}, "<C-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Keybinding for ^ and $ to move to the beginning and end of the line
vim.keymap.set({ "n", "v" }, "H", "<cmd>normal! ^<CR>", { desc = "Move to the beginning of the line" })
vim.keymap.set({ "n", "v" }, "L", "<cmd>normal! $<CR>", { desc = "Move to the end of the line" })

vim.keymap.set("n", "zh", "20zh", { desc = "Scroll left" })
vim.keymap.set("n", "zl", "20zl", { desc = "Scroll right" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "move to next word with cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "move to previous word with cursor centered" })

-- indent and unindent lines in visual mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Copy Selected Text to Clipboard in Visual Mode
vim.keymap.set("v", "<leader>cc", '"+y', { desc = "Copy selected text to clipboard" })

-- Copy Entire Page to Clipboard in Normal and Visual Modes
vim.keymap.set("n", "<leader>cp", ":%y+<CR>", { desc = "Copy entire page to clipboard" })
vim.keymap.set("v", "<leader>cp", "<ESC>:%y+<CR>", { desc = "Copy entire page to clipboard" })

-- Obsidian
vim.keymap.set(
	"n",
	"<leader>oc",
	"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
	{ desc = "Obsidian Check Checkbox" }
)
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink<CR>", { desc = "Follow Note Reference" })
vim.keymap.set("n", "<leader>oh", "<cmd>ObsidianFollowLink hsplit<CR>", { desc = "Open Note Reference in hsplit" })
vim.keymap.set("n", "<leader>ov", "<cmd>ObsidianFollowLink vsplit<CR>", { desc = "Open Note Reference in vsplit" })
vim.keymap.set("n", "<leader>oi", "<cmd>ObsidianTOC<CR>", { desc = "Table of Contents" })

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

-- Keybindings for Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Go to next tab" })

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", {
    silent = true,
    desc = "Markdown Preview Toggle"
})

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lp", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

