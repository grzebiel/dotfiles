local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- vim.keymap.set("n", "<C-space>", rt.hover_action.hover_action, { buffer = bufnr })
            -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action.group, { buffer = bufnr })
        end,
    },
})
