return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "saghen/blink.cmp",
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      { "j-hui/fidget.nvim", opts = {} },

      -- Autoformatting
      "stevearc/conform.nvim",

      -- Schema information
      "b0o/schemastore.nvim",
    },
    config = function()
      require("neodev").setup {
        -- TODO: ref: lazydev.nvim
        -- library = {
        --   plugins = { "nvim-dap-ui" },
        --   types = true,
        -- },
      }

      -- local capabilities = require("blink.cmp").get_lsp_capabilities()

      local lspconfig = require "lspconfig"

      local util = require "lspconfig.util"

      local servers = {
        bashls = true,
        -- gopls = {
        --   settings = {
        --     gopls = {
        --       hints = {
        --         assignVariableTypes = true,
        --         compositeLiteralFields = true,
        --         compositeLiteralTypes = true,
        --         constantValues = true,
        --         functionTypeParameters = true,
        --         parameterNames = true,
        --         rangeVariableTypes = true,
        --       },
        --     },
        --   },
        -- },
        lua_ls = true,
        rust_analyzer = true,
        svelte = true,
        templ = true,

        -- Probably want to disable formatting for this lang server
        tsserver = true,
        astro = true,

        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },

        ocamllsp = {
          manual_install = true,
          settings = {
            codelens = { enable = true },
            inlayHints = { enable = true },
          },

          filetypes = {
            "ocaml",
            "ocaml.interface",
            "ocaml.menhir",
            "ocaml.cram",
          },
        },

        clangd = {
          -- TODO: Could include cmd, but not sure those were all relevant flags.
          --    looks like something i would have added while i was floundering
          init_options = { clangdFileStatus = true },
          filetypes = { "c" },
        },

        emmet_language_server = {
          filetypes = { "astro", "html" },
        },
        tailwindcss = {},
        mdx_analyzer = {
          cmd = { "mdx-language-server", "--stdio" },
          filetypes = { "markdown.mdx" },
          root_dir = util.root_pattern "package.json",
        },
        biome = {},
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      require("mason").setup()
      local ensure_installed = {
        "stylua",
        "lua_ls",
        "tailwindcss-language-server",
      }

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

          vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })

          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end

          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
            if vim.lsp.buf.format then
              vim.lsp.buf.format()
            elseif vim.lsp.buf.formatting then
              vim.lsp.buf.formatting()
            end
          end, { desc = "Format current buffer with LSP" })
        end,
      })

      -- Autoformatting Setup
      -- ISSUE: web dev: https://github.com/stevearc/conform.nvim/issues/291#issuecomment-2004022974
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          astro = { "biome", "prettier" },
          typescript = { { "prettierd", "prettier" }, "biome" },
          typescriptreact = { { "prettierd", "prettier" }, "biome" },
          javascript = { { "prettierd", "prettier" }, "biome" },
          javascriptreact = { { "prettierd", "prettier" }, "biome" },
          toml = { { "prettierd", "prettier" }, "taplo" },
        },
      }

      local capabilities_astro = vim.lsp.protocol.make_client_capabilities()
      capabilities_astro.textDocument.completion.completionItem.snippetSupport = true

      require("lspconfig").cssls.setup {
        capabilities = capabilities_astro,
        filetypes = { "astro", "css" },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format {
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          }
        end,
      })
    end,
  },
}
