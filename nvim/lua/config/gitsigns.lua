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

-- offical setting https://github.com/lewis6991/gitsigns.nvim
vim.keymap.set('n', '<leader>ghs', gs.stage_hunk, { desc = "Stage Hunk" })
vim.keymap.set('n', '<leader>ghr', gs.reset_hunk, { desc = "reset_hunk" })
vim.keymap.set('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
  { desc = "stage_hunk" })
vim.keymap.set('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
  { desc = "reset_hunk" })
vim.keymap.set('n', '<leader>ghS', gs.stage_buffer, { desc = "stage_buffer" })

-- NOTE : view import 
vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, { desc = "[P]review Hunk" })

vim.keymap.set('n', '<leader>ghb', function() gs.blame_line { full = true } end, { desc = "blame_line" })
vim.keymap.set('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = "toggle_current_line_blame" })

vim.keymap.set("n", "<leader>ghd", gs.diffthis)
vim.keymap.set("n", "<leader>ghD", function() gs.diffthis("~") end)

-- 🧐
-- vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
