local servers = {'clangd', 'lua_ls', 'pyright', 'rust_analyzer'}
return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        config = function()
            require('mason-lspconfig').setup{
                ensure_installed = servers,
            };
        end,
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
        },
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/nvim-cmp",
        enabled = true;
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                -- dependencies = {"neovim/nvim-lspconfig"},
                -- "hrsh7th/cmp-nvim-lsp",
            },
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<CR>"] = cmp.mapping.confirm({select=true}),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    {
                        name = "lazydev",
                        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
                    }
                }, {
                    { name = "buffer" },
                }),
            })
            local capabilities = require('cmp_nvim_lsp').default_capabilities();
            vim.lsp.config('*', {
                capabilities = capabilities,
            });
        end

    },


{
  'saghen/blink.cmp',
  enabled = false,
  config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('blink.cmp').setup{
          signature = {
              enabled = true,
          },
          completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
          }
      }
      };
      vim.lsp.config('*', { capabilities = capabilities, });
  end
},



    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        enabled = true,
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },



}
