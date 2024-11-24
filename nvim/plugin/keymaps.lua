local set = vim.keymap.set

set("i", "jk", "<ESC>")
set("i", "kj", "<ESC>")

-- NOTE : move line pos
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")

-- NOTE : paste without overlapping the yank buffer
set("x", "<leader>p", '"_dP')

set("n", "<Esc>", "<cmd>noh<CR>", { noremap = false, desc = "[N][O][H]ighlight" })

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-n>", "<c-w>5+")
set("n", "<M-m>", "<c-w>5-")

set("n", "<leader>sl", vim.cmd["split"], { desc = "Horizontal split" })
set("n", "<leader>vl", vim.cmd["vsplit"], { desc = "Vertical split" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
