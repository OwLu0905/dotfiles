local options = {
    number = true,
    relativenumber = true,
    hlsearch = true, -- Set highlight on search
    mouse = 'a',     -- Enable mouse mode

    -- Sync clipboard between OS and Neovim.
    --  Remove this option if you want your OS clipboard to remain independent.
    --  See `:help 'clipboard'`
    clipboard = 'unnamedplus',
    breakindent = true, -- Enable break indent
    undofile = true,    -- Save undo history

    -- Case-insensitive searching UNLESS \C or capital in search
    ignorecase = true,
    smartcase = true,

    -- 🧐 Decrease update time
    updatetime = 250,
    timeout = true,
    timeoutlen = 300,
    completeopt = 'menuone,noselect', -- Set completeopt to have a better completion experience
    termguicolors = true,             -- NOTE: You should make sure your terminal supports this

    -- NOTE : set spacing
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    showtabline = 2,
}

local window_options = {
    -- Keep signcolumn on by default
    signcolumn = 'yes'
}



for option, value in pairs(options) do
    vim.opt[option] = value
end

for option, value in pairs(window_options) do
    vim.wo[option] = value
end
