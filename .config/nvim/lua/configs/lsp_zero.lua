local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

local ih = require('lsp-inlayhints')
local lspconfig = require('lspconfig')
-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        ih.on_attach(client, bufnr)
    end,
    settings = {
        clangd = {
            hint = {
                enable = true,
            }
        }
    }
}
lspconfig.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        ih.on_attach(client, bufnr)
    end,
    settings = {
        ['rust-analyzer'] = {
            hint = {
                enable = true,
            }
        }
    }
}

lsp.setup()
