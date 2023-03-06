-- NOTE : insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- NOTE : terminal node
vim.keymap.set("t", "<leader>jk", "<c-\\><c-N>")
vim.keymap.set("t", "<leader>kj", "<c-\\><c-N>")


-- NOTE : relative line number
-- vim.o.nu = false -- cancel float line number
-- vim.o.nu = true -- cancel float line number
vim.o.rnu = true
-- vim.o.cursorline = true

-- NOTE : move line pos
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- NOTE : paste without overlapping the yank buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- NOTE : set winbar 
-- local light_blue = "#22d3ee"
local light_pink =  "#f472b6"
local miku_blue = "#00FFFF"
local light_gold = "#EADCBA"
vim.o.winbar= "%=%m<3 %f"
vim.api.nvim_set_hl(0, "Winbar", {fg = miku_blue , bold=true})
vim.api.nvim_set_hl(0, "LineNr", {fg = light_gold})
-- vim.api.nvim_set_hl(0, 'CursorLineNr', {fg=light_pink, bold=true})
--
-- vim.api.nvim_set_hl(0, '@text.note', {fg = "#ffffff" , bg = "#b00b69"})
vim.api.nvim_set_hl(0, '@text.note', {fg = "#f472b6"})

-- toggle tree
vim.keymap.set("n", "<leader>EL", vim.cmd ['Explore'], {desc = '[E]xp[l]ore'})
vim.keymap.set("n", "<leader>SL", vim.cmd ['Sexplore'], {desc = '[S]exp[l]ore'})
vim.keymap.set("n", "<leader>VL", vim.cmd ['Vexplore'], {desc = '[V]exp[l]ore'})
vim.keymap.set('n', "<leader>RL", vim.cmd ['Ntree'], {desc = 'Ntree'})
vim.keymap.set('n', "<leader>TL", vim.cmd ['Texplore'], {desc = '[T]exp[l]ore'})

-- split windows
vim.keymap.set("n", "<leader>sl", vim.cmd ['split'], {desc = 'Horizontal split'})
vim.keymap.set("n", "<leader>vl", vim.cmd ['vsplit'], {desc = 'Vertical split'})


-- TODO : add tab relative work
