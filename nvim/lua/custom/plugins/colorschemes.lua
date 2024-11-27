return {
  {
    lazy = false,
    priority = 1000,
    dir = "~/plugins/colorbuddy.nvim",
    config = function()
      -- vim.cmd.colorscheme "everforest"
      -- vim.cmd.colorscheme "tokyonight"
      vim.cmd.colorscheme "sunburn"
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  "folke/tokyonight.nvim",
  "neanias/everforest-nvim",
  "EdenEast/nightfox.nvim",
  {
    "loganswartz/sunburn.nvim",
    dependencies = { "loganswartz/polychrome.nvim" },
    -- you could do this, or use the standard vimscript `colorscheme sunburn`
  },
}
