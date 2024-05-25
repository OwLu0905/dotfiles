require("nvim-tree").setup({
  view = {
    side = 'right'
  },
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  -- git = {
  --   enable = true,
  --   ignore = false,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  --   timeout = 400,
  -- },
})

local api = require('nvim-tree.api')
local function opts(desc)
  return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

-- NOTE nvim_tree keymaps
-- vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<enter>", { desc = "NvimtreeToggl[E]" })
vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle <CR>", { desc = "NvimtreeToggl[E]" })
-- vim.keymap.set('n', '<leader>fe', ":NvimTreeFindFileToggle <CR>", { desc = "NvimtreeFind[F]ileToggl[E]" })
vim.keymap.set('n', '<leader>fe', "<cmd>NvimTreeFindFile <CR>", { desc = "NvimtreeFind[F]il[E]" })
