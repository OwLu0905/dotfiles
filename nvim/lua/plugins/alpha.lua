  return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() 
	    -- require("alpha").setup(require("alpha.themes.startify").config)
	    require("config.alpha")
    end
  }
