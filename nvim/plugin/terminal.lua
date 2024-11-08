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
vim.keymap.set("t", "<Esc>", "<c-\\><c-N>")

local Terminal = {
  buf = nil,
  win = nil,
  term = nil,
}

local function create_terminal()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  Terminal.buf = vim.api.nvim_get_current_buf()
  Terminal.win = vim.api.nvim_get_current_win()
  Terminal.term = vim.fn.termopen(vim.o.shell)
  vim.cmd.startinsert()
end

local function toggle_terminal()
  if Terminal.win and vim.api.nvim_win_is_valid(Terminal.win) then
    vim.api.nvim_win_hide(Terminal.win)
    Terminal.win = nil
  else
    if Terminal.buf and vim.api.nvim_buf_is_valid(Terminal.buf) then
      vim.cmd.split()
      vim.cmd.wincmd "J"
      vim.api.nvim_win_set_buf(0, Terminal.buf)
      vim.api.nvim_win_set_height(0, 12)
      vim.wo.winfixheight = true
      Terminal.win = vim.api.nvim_get_current_win()
      vim.cmd.startinsert()
    else
      create_terminal()
    end
  end
end
vim.keymap.set("n", "<C-\\>", toggle_terminal, { noremap = true, silent = true })
vim.keymap.set("t", "<C-\\>", toggle_terminal, { noremap = true, silent = true })

-- Open a terminal at the bottom of the screen with a fixed height.
-- vim.keymap.set("n", "<C-\\>", function()
--   vim.cmd.new()
--   vim.cmd.wincmd "J"
--   vim.api.nvim_win_set_height(0, 12)
--   vim.wo.winfixheight = true
--   vim.cmd.term()
-- end)

-- NOTE : terminal node
-- vim.keymap.set("t", "<leader>jk", "<c-\\><c-N>")
-- vim.keymap.set("t", "<leader>kj", "<c-\\><c-N>")
-- vim.keymap.set("t", "<C-x>", "<c-\\><c-N>")
