return {
    {
        "aserowy/tmux.nvim",
        config = function()
            local tmux = require("tmux")
            tmux.setup()
        end
    },
    {
        "vimpostor/vim-tpipeline",
        config = function()
            vim.g.tpipeline_autoembed = 0
            vim.g.tpipeline_clearstl = 1
        end
    },
}
