require("toggleterm").setup{
  size = 10,
  open_mapping = [[<F7>]],
  shading_factor = 2,
  direction = "float",
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
vim.cmd([[nnoremap <c-\> :ToggleTerm direction=horizontal<cr>]])
vim.cmd([[nnoremap <F7> :ToggleTerm direction=float<cr>]])
