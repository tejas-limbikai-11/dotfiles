return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                icons_enabled = true, -- Enable icons globally
            },
            sections = {
                lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },

                lualine_c = {
                    {
                        "filename",
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
            },
        })
    end,
}
