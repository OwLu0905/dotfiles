require("bufferline").setup {
    options = {
        mode = "buffers",
        diagnostics = "nvim_lsp"
    }
}

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "[B]uffer [P]in" })
vim.keymap.set("n", "<leader>bda", "<Cmd>BufferLineGroupClose ungrouped<CR>",
    { desc = "[B]uffer [D]elete [A]ll non-pinned" })

vim.keymap.set("n", "<leader>bf", "<cmd>BufferLinePick<cr>", { desc = "[B]uffer [F]ind" })
