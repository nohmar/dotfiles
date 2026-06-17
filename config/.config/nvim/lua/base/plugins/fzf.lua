return {
  "junegunn/fzf.vim",

  dependencies = { "junegunn/fzf" },

  config = function()
    vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
    vim.g.fzf_layout = { down = '40%' }
    vim.keymap.set("n", "<leader>e", ":FZF<cr>", { noremap = true })
  end
}
