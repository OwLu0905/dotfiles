local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<S-tab>"] = trouble.open_with_trouble },
        },
    },
}

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
