local opt = vim.opt

opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences (tj) -----
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"

----- Personal Preferences (myself) -----
opt.mouse = "a"
-- opt.list = true
-- opt.listchars = { eol = "↵" }
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.cursorline = true

-- Don't have `o` add a comment
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt_local.fo:remove "o"
    vim.opt_local.fo:remove "r"
  end,
})

-- You might want the current line number to be a different shade
vim.api.nvim_command "highlight CursorLineNr guifg=#FFAAFF gui=bold"
