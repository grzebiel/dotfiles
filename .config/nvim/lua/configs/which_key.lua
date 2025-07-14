-- faster trigger
vim.opt.timeoutlen=300

require("which-key").setup {
    preset = "modern",
    plugins = {
        spelling = { enabled = true, suggestions = 20 },
        registers = true,
    },
    -- window = {
    --     padding = { 2, 2, 2, 2},
    --     border = "rounded",
    -- }
}
