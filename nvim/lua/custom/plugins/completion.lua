return {
  -- {
  --   "hrsh7th/nvim-cmp",
  --   lazy = false,
  --   priority = 100,
  --   dependencies = {
  --     "onsails/lspkind.nvim",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-buffer",
  --     { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   config = function()
  --     require "custom.completion"
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    version = "v0.*",

    opts = {
      keymap = { preset = "default" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      -- experimental signature help support
      signature = { enabled = true },
    },
  },
}
