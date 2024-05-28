return {
  "junegunn/fzf.vim",

  dependencies = { "junegunn/fzf" },

  config = function()
    vim.g.fzf_layout = { down = '40%' }
    vim.keymap.set("n", "<leader>e", ":FZF<cr>", { noremap = true })
  end
}
