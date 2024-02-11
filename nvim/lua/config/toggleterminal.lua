require('toggleterm').setup({
  size = 16,
  open_mapping = [[<c-\>]],
  direction = "float",
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>",
  { noremap = true, silent = true, desc = "[L][G] toggle float lazygit" })


vim.api.nvim_set_keymap("n", "<leader>vv", "<cmd>ToggleTerm size=60 direction=vertical<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>ToggleTerm size=20 direction=horizontal<CR>", {})
vim.api.nvim_set_keymap("t", "<C-x>", "<cmd>ToggleTerm <CR>", {})
