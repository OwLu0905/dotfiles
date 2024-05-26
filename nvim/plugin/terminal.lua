local set = vim.opt_local

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
  end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<Esc><Esc>", "<c-\\><c-N>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

-- NOTE : terminal node
vim.keymap.set("t", "<leader>jk", "<c-\\><c-N>")
vim.keymap.set("t", "<leader>kj", "<c-\\><c-N>")
vim.keymap.set("t", "<C-x>", "<c-\\><c-N>")
