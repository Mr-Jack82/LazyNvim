return {
  -- add symbols-outline
  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = {
      { "s", "<cmd>HopChar1<CR>", mode = { "n" } },
      { "<leader>/", "<cmd>HopPattern<CR>", mode = { "n", "v" } },
      { "f", "<cmd>HopChar1CurrentLineAC<CR>", mode = { "n", "v", "o" } },
      { "F", "<cmd>HopChar1CurrentLineBC<CR>", mode = { "n", "v", "o" } },
      { "z", "<cmd>HopChar1<CR>", mode = { "o" } },
    },
    config = function()
      require("hop").setup({
        uppercase_labels = true,
      })
    end,
  },
}
