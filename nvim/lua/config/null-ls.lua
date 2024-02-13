local null_ls = require("null-ls")

-- register any number of sources simultaneously
local null_sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.sqlfmt,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.code_actions.gitsigns,
}
--
null_ls.setup({ sources = null_sources })

-- format shortcut
vim.cmd [[ command! Format execute 'lua vim.lsp.bug.format()' ]]
