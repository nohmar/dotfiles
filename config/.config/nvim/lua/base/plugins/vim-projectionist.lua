return {
  "tpope/vim-projectionist",

  init = function()
    vim.g.projectionist_heuristics = {
      ["*"] = {
        ["test/*_test.rb"] = {
          alternate = "app/{}.rb",
          type = "test"
        },
        ["test/lib/*_test.rb"] = {
          alternate = "lib/{}.rb",
          type = "test"
        },
        ["app/*.rb"] = {
          alternate = "test/{}_test.rb",
          type = "source"
        },
        ["lib/*.rb"] = {
          alternate = "test/lib/{}_test.rb",
          type = "source"
        }
      }
    }
  end
}
