local tree_config = require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim', 'svelte' },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
