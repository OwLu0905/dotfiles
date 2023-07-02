-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- NOTE : insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")


-- NOTE : terminal node
vim.keymap.set("t", "<leader>jk", "<c-\\><c-N>")
vim.keymap.set("t", "<leader>kj", "<c-\\><c-N>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- NOTE : move line pos

-- NOTE : paste without overlapping the yank buffer
vim.keymap.set("x", "<leader>p", "\"_dP")


-- NOTE : set winbar
-- local light_blue = "#22d3ee"
local light_pink = "#f472b6"
local miku_blue = "#00FFFF"
local light_gold = "#EADCBA"

-- local file_path = vim.api.nvim_eval_statusline('%f', {}).str
-- local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '⊚' or ''
--
-- file_path = file_path:gsub('/', ' ➤ ')
-- local final_status = '%#WinBarPath#'
--     .. file_path
--     .. '%*'
--     .. '%#WinBarModified#'
--     .. modified
--     .. '%*'
--
-- -- vim.o.winbar= "%=%m<3 %f"
-- -- vim.o.winbar= "%f"
-- -- vim.o.winbar = "%{%v:lua.M.eval()%}"
-- vim.o.winbar = final_status


-- vim.api.nvim_set_hl(0, "Winbar", { fg = miku_blue, bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = light_gold })
vim.api.nvim_set_hl(0, '@text.note', { fg = "#f472b6" })

-- split windows
vim.keymap.set("n", "<leader>sl", vim.cmd['split'], { desc = 'Horizontal split' })
vim.keymap.set("n", "<leader>vl", vim.cmd['vsplit'], { desc = 'Vertical split' })

-- toggle tree
-- vim.keymap.set("n", "<leader>EL", vim.cmd['Explore'], { desc = '[E]xp[l]ore' })
-- vim.keymap.set("n", "<leader>SL", vim.cmd['Sexplore'], { desc = '[S]exp[l]ore' })
-- vim.keymap.set("n", "<leader>VL", vim.cmd['Vexplore'], { desc = '[V]exp[l]ore' })
-- vim.keymap.set('n', "<leader>RL", vim.cmd['Ntree'], { desc = 'Ntree' })
-- vim.keymap.set('n', "<leader>TL", vim.cmd['Texplore'], { desc = '[T]exp[l]ore' })


-- TODO : add tab relative work
-- NOTE : move between buffers
vim.keymap.set("n", "<leader>tj", vim.cmd['bnext'], { desc = "[T]o next[j]" })
vim.keymap.set("n", "<leader>tk", vim.cmd['bprev'], { desc = "[T]o prev[k]" })
vim.keymap.set("n", "<leader>tl", "<cmd>blast<CR>", { noremap = false, desc = "[T]o last[L]" })
vim.keymap.set("n", "<leader>th", "<cmd>bfirst<CR>", { noremap = false, desc = "[T]o first[H]" })


-- NOTE : nvim_tree (https://github.com/nvim-tree/nvim-tree.lua)
-- -- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- NOTE Format
vim.keymap.set("n", "<leader>fw", function()
  vim.lsp.buf.format()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    print(client.name)
  end
end
)
