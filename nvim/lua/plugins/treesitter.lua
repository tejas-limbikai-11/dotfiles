return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup ({
      auto_install = true,
      ensure_installed = {
        "html",        -- HTML support
        "lua",         -- Lua support
        "javascript",  -- JavaScript support
        "java",        -- Java support
        "python",      -- Python support
        "css",         -- CSS support (optional, for styling)
      },
      highlight = { enable = true },
      -- indent = { enable = true },
    })
  end
}
