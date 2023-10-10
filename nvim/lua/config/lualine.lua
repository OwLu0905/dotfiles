require("lualine").setup({
    sections = { lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" } },
    winbar = {
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})
