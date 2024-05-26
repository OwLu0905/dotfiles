require("lualine").setup {
  -- sections = { lualine_c = { "os.date('%a')", "data", "require'lsp-status'.status()" } },
  sections = {
    lualine_c = {
      {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
  },
  component_separators = "",
  section_separators = "",
  winbar = {
    lualine_b = {},
    -- lualine_c = { "filename", path = 1 },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
