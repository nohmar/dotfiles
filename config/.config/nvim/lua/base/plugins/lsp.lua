return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "elixirls",
        "ruby_lsp",
        "tsserver",
      },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup{}
        end,
      }
    })

    -- Follow the server config instructions for `lua_ls` server. This eliminates
    -- some noisy errors.
    require('lspconfig').lua_ls.setup({
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT'
          },

          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library"
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })

    require('lspconfig').rust_analyzer.setup({
      on_init = function()
        vim.g.rustfmt_autosave = 1
      end
    })
  end
}
