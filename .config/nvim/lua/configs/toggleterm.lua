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

active_terminals = {}

function toggle_term_cmd(opts)
  local terms = active_terminals
  -- if a command string is provided, create a basic table for Terminal:new() options
  if type(opts) == "string" then opts = { cmd = opts, hidden = true } end
  local num = vim.v.count > 0 and vim.v.count or 1
  -- if terminal doesn't exist yet, create it
  if not terms[opts.cmd] then terms[opts.cmd] = {} end
  if not terms[opts.cmd][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
    terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  terms[opts.cmd][num]:toggle()
end


vim.cmd([[nnoremap <c-\> :1ToggleTerm direction=horizontal<cr>]])
vim.cmd([[tnoremap <c-\> <c-\><c-n>:1ToggleTerm<cr>]])
vim.cmd([[nnoremap <c--> :2ToggleTerm direction=float<cr>]])
vim.cmd([[tnoremap <c--> <c-\><c-n>:2ToggleTerm direction=float<cr>]])
