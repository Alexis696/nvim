return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configure language servers using the new recommended API
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = { vim.fn.expand("$VIMRUNTIME/lua") },
            },
          },
        },
      })

      vim.lsp.config("ts_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })

      -- Enable the language servers
      vim.lsp.enable({ "lua_ls", "ts_ls", "pyright" })

      -- Your keymaps (kept exactly as before)
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, {})
    end,
  },
}
