return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
            }
        },
        config = function()
            require('telescope').setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            preview_width = 0.5,
                        },
                    },
                }
            });
            require('telescope').load_extension('fzf');

            vim.keymap.set('n', '<Leader>s', require('telescope.builtin').buffers, {desc = "buffers"});

            vim.keymap.set('n', '<Leader>/', require'config.multigrep', {desc = "live_grep"});

            vim.keymap.set('n', '<C-p>', function()
                require('telescope.builtin').find_files{
                    hidden = true
                }
            end, {desc = "telescope files"});

            vim.keymap.set({ "n", "v" }, '<Leader>g', require('telescope.builtin').grep_string, {desc = "grep under cursor"});

            vim.keymap.set("n", "<leader>cp", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath("config"),
                };
            end, {desc = "open config file"});

            vim.keymap.set("n", "<leader>cg", function()
                require('telescope.builtin').live_grep {
                    cwd = vim.fn.stdpath("config"),
                };
            end, {desc = "grep in nvim config"});

            vim.keymap.set("n", "<leader>h", function()
                require('telescope.builtin').help_tags {};
            end, {desc = 'help tags'});

            vim.keymap.set("n", "<leader>m", function()
                require('telescope.builtin').man_pages {
                    sections = { "ALL" },
                };
            end, {desc = 'man pages'});
        end
    },
}
