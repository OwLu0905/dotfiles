return {
  {
    "OwLu0905/wes.nvim",
    dir = "~/.config/lua_plugin/wes.nvim/",
    dependencies = {},
    config = function()
      require("wes").setup {
        telescope_bind = true,
      }
    end,
  },
}
