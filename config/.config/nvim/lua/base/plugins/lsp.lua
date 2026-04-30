return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "rust-lang/rust.vim"
  },

  config = function()
    -- Set PATH config to 'append' to ensure system packages are prioritized over
    -- ones installed by Mason e.g. `rust-analyzer`.
    require("mason").setup({
      PATH = "append"
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "elixirls",
        "ruby_lsp",
        "tsserver",
        "gopls"
      },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup{}
        end,
      }
    })

    -- Follow the server config instructions for `lua_ls` server. This eliminates
    -- some noisy errors.
    vim.lsp.config('lua_ls', {
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

    vim.lsp.config('rust_analyzer', {
      on_init = function()
        vim.g.rustfmt_autosave = 1
      end
    })

    vim.lsp.config('ruby_lsp', {
      init_options = {
        formatter = 'standard',
        linters = { 'standard' },
      },
    })
  end
}
