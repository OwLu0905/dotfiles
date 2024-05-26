require("telescope").setup({
    extensions = {
        undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.8,
            },
        },
    },
})

vim.keymap.set("n", "<leader>uu", "<cmd>Telescope undo<CR>", { desc = "Search [U]ndo" })
