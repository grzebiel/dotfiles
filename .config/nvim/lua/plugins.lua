local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- directory tree
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function() require 'configs/neotree' end
  }

  -- status line
  use 'itchyny/lightline.vim'
  -- use {"rebelot/heirline.nvim",
  --   config = function() require 'configs/heirline' end}

  -- ack/ag support
  use 'mileszs/ack.vim'

  use 'octol/vim-cpp-enhanced-highlight'
  use 'nickhutchinson/vim-cmake-syntax'
  use 'potatoesmaster/i3-vim-syntax'

  -- git integration
  use 'tpope/vim-fugitive'

  -- show git line changed
  use 'airblade/vim-gitgutter'

  -- fzf
  use 'junegunn/fzf.vim'

  -- auto comment out
  use 'tpope/vim-commentary'

  -- goyo
  -- limelight
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- lsp support
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  config = function() require 'configs.lsp_zero' end,
  requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- lsp-inlayhits
  use {
      'lvimuser/lsp-inlayhints.nvim',
      config = function() require 'configs.lsp_inlayhints' end,
  }

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
      config = function() require 'configs/treesitter' end
  }
  -- use {
  --     'neoclide/coc.nvim', branch = 'release',
  --     config = function() require 'configs/coc' end
  -- }

  -- -- lua support
  -- use 'rafcamlet/coc-nvim-lua'

  -- inline lsp info
  use {
      "Maan2003/lsp_lines.nvim",
      config = function() require 'configs/lsp_lines' end
  }

  -- keymaps popup
  use {
    "folke/which-key.nvim",
    config = function() require 'configs/which_key' end
  }

  -- terminal windows
  use {
    "akinsho/toggleterm.nvim",
    config = function() require "configs/toggleterm" end,
  }

  -- dap
  use {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    config = function() require "configs/mason" end,
  }

  -- use {
  -- "folke/noice.nvim",
  -- config = function() require "configs/noice" end,
  -- requires = {
  --   -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --   "MunifTanjim/nui.nvim",
  --   -- OPTIONAL:
  --   --   `nvim-notify` is only needed, if you want to use the notification view.
  --   --   If not available, we use `mini` as the fallback
  --   "rcarriga/nvim-notify",
  --   }
  -- }

  -- openai interface
  -- use 'madox2/vim-ai'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

