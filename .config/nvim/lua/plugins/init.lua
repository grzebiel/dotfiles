return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            popup_border_style = "rounded",
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        config = function()
            require('configs.neotree');
        end

    },
    {
        'itchyny/lightline.vim',
        config = function()
            vim.cmd [[    let g:lightline = {
                \ 'colorscheme': 'powerline',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
                \ },
                \ 'component': {
                \   'readonly': '%{&readonly?"":""}',
                \   'modified': '%{&filetype=="help"?"":&modified?" ":&modifiable?"":"-"}'
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightLineFugitive',
                \ },
                \ 'separator': { 'left': '', 'right': '' },
                \ 'subseparator': { 'left': '|', 'right': '|' }
                \ } ]]
        end
    },
    'potatoesmaster/i3-vim-syntax',
    -- git integration
    'tpope/vim-fugitive',

    -- show git line changed
    'airblade/vim-gitgutter',

    -- -- fzf
    -- 'junegunn/fzf',
    -- 'junegunn/fzf.vim',

    -- auto comment out
    'tpope/vim-commentary',

    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            vim.opt.termguicolors = true;
            vim.notify = require("notify");
            vim.notify.setup({
                -- render = "compact",   -- optional: notification style
                stages = "fade",  -- or "slide", "fade_in_slide_out", etc.
                top_down = false, -- stack notifications from the bottom up
                timeout = 3000,   -- optional: notification display time in ms
            })
        end
    },



    -- keymaps popup
    {
        "folke/which-key.nvim",
        dependencies = { "echasnovski/mini.icons" },
        opts = {
        },
        config = function()
            require("configs.which_key");
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        branch = 'master',
        lazy = false,
        config = function() require 'configs/treesitter' end
    },

    -- terminal windows
    {
        "akinsho/toggleterm.nvim",
        config = function() require "configs/toggleterm" end,
    },

    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function() require("hardtime").setup() end
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                "nvim-dap-ui"
            },
        },
    },

    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
