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

  -- rust support
  use 'rust-lang/rust.vim'

  -- auto comment out
  use 'tpope/vim-commentary'

  -- goyo
  -- limelight
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- lsp support
  use {
      'neoclide/coc.nvim', branch = 'release',
      config = function() require 'configs/coc' end
  }

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

  use {
    "akinsho/toggleterm.nvim",
    config = function() require "configs/toggleterm" end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

