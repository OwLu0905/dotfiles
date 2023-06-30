
vim.o.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- 🧐 Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- NOTE : set spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2




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
vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<enter>", { desc = "NvimtreeToggl[E]" })
vim.keymap.set('n', '<leader>fe', ":NvimTreeFindFileToggle<enter>", { desc = "NvimtreeFind[F]ileToggl[E]" })
