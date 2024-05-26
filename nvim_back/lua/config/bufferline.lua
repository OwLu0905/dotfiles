require("bufferline").setup {}

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "[B]uffer [P]in" })
vim.keymap.set("n", "<leader>bda", "<Cmd>BufferLineGroupClose ungrouped<CR>",
    { desc = "[B]uffer [D]elete [A]ll non-pinned" })

vim.keymap.set("n", "<leader>bf", "<cmd>BufferLinePick<cr>", { desc = "[B]uffer [F]ind" })
vim.keymap.set("n", "<leader>dl", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
vim.keymap.set("n", "<leader>dh", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete buffers to the left" })
