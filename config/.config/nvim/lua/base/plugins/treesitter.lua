return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "elixir",
        "git_rebase",
        "graphql",
        "javascript",
        "json",
        "markdown",
        "rust",
        "ruby",
        "sql",
        "tsx",
        "typescript",
        "vimdoc",
        "yaml",
      },

      auto_install = true,

      sync_install = false,

      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
      }
    })
  end
}
