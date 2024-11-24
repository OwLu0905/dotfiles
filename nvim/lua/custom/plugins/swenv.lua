return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "AckslD/swenv.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python" },
        callback = function()
          vim.keymap.set("n", "<leader>vv", function()
            require("swenv.api").pick_venv()
          end, { buffer = true })
        end,
      })
      -- -- Remove the keymap when leaving a Python buffer
      -- vim.api.nvim_create_autocmd("BufLeave", {
      --   pattern = { "python" },
      --   callback = function()
      --     -- Clear the buffer-local keymap
      --     vim.keymap.del("n", "<leader>vv", { buffer = true })
      --   end,
      -- })
    end,
  },
}
