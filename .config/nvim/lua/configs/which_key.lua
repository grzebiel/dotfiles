-- faster trigger
vim.opt.timeoutlen=300

require("which-key").setup {
    plugins = {
        spelling = { enabled = true }
    },
    window = {
        padding = { 2, 2, 2, 2},
    }
}
