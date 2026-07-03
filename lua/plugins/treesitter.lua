return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  dependencies = {
    "mks-h/treesitter-autoinstall.nvim",   -- ← this does the auto-install
  },

  config = function()
    require("nvim-treesitter").setup({
      -- Optional: change install directory if you want
      -- install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Auto-install parsers when you open a new filetype
    require("treesitter-autoinstall").setup({
      ignore = {},        -- languages you never want to auto-install
      highlight = true,   -- auto-enable highlighting for installed languages
      regex = {},         -- extra languages to use regex highlighting for
    })
  end,
}
