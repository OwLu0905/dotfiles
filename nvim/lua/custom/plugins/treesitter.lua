return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { dir = "tjdevries/tree-sitter-lua" },
    },
    branch = "main",
    lazy = false,
    config = function()
      require("custom.treesitter").setup()
    end,
  },
}
