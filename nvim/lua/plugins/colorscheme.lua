return {

  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- require("onedark").setup({
      --   transparent = false,
      --   lualine = {
      --     transparent = true, -- lualine center bar transparency
      --   },
      -- })

      -- vim.cmd([[colorscheme onedark]])
    end,
  },
  -- priority = 1000,
  -- config = function()
  --   vim.cmd.colorscheme 'onedark'
  -- end,
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
        -- vim.cmd([[colorscheme everforest]])
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd([[colorscheme  nordfox]])
    end
  },
  { 'olivercederborg/poimandres.nvim' },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- require("catppuccin").setup({ flavour = "frappe", transparent_background = true })
      -- vim.cmd([[colorscheme  catppuccin]])
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',

    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
      })

      -- vim.cmd([[colorscheme  rose-pine]])
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("solarized-osaka").setup({
      --   transparent = false,
      -- })
      -- vim.cmd([[colorscheme solarized-osaka]])
    end
  }
  -- { 'Tsuzat/NeoSolarized.nvim' }
}
