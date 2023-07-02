require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

local gs = package.loaded.gitsigns

vim.keymap.set("n", "<leader>ghd", gs.diffthis)
vim.keymap.set("n", "<leader>ghD", function() gs.diffthis("~") end)
vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, {desc = "[P]review Hunk"})

