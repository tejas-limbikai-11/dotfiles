return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,       -- Automatically close tags
        enable_rename = true,      -- Automatically rename paired tags
        enable_close_on_slash = false, -- Auto-close on trailing </
      },
      per_filetype = {},
    })
  end,
}

