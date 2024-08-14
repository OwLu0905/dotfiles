return {
  {
    lazy = false,
    priority = 1000,
    dir = "~/plugins/colorbuddy.nvim",
    config = function()
      vim.cmd.colorscheme "everforest"
      -- vim.cmd.colorscheme "tokyonight"
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  "folke/tokyonight.nvim",
  "neanias/everforest-nvim",
  "EdenEast/nightfox.nvim",
}
