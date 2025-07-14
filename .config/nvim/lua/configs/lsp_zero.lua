local lsp = require('lsp-zero').preset({})
print("lsp-zero is beeing included")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr, preserve_mappings = false})
end)

-- local ih = require('lsp-inlayhints')
local lspconfig = require('lspconfig')
-- -- (Optional) Configure lua language server for neovim
-- lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
-- lspconfig.clangd.setup {
--     on_attach = function(client, bufnr)
--         ih.on_attach(client, bufnr)
--     end,
--     settings = {
--         clangd = {
--             hint = {
--                 enable = true,
--             }
--         }
--     }
-- }
-- lspconfig.rust_analyzer.setup {
--     on_attach = function(client, bufnr)
--         ih.on_attach(client, bufnr)
--     end,
--     settings = {
--         ['rust-analyzer'] = {
--             hint = {
--                 enable = true,
--             }
--         }
--     }
-- }

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

lsp.setup()
