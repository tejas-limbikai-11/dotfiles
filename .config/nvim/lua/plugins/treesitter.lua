return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            ensure_installed = {
                "html", -- HTML support
                "lua", -- Lua support
                "javascript", -- JavaScript support
                "java", -- Java support
                "python", -- Python support
                "css", -- CSS support (optional, for styling)
                "go",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ejs" },
            },
            -- indent = { enable = true },
        })
        vim.treesitter.language.register("html", "ejs")
        vim.treesitter.language.register("javascript", "ejs")
    end,
}
