return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require('dap');
            dap.adapters.python = {
                type = 'executable',
                command = '/usr/bin/python',
                args = { '-m', 'debugpy.adapter' },
            }
            -- Configure LLDB adapter
            dap.adapters.lldb = {
                name = "lldb",
                type = "executable",
                command = "/usr/bin/lldb-dap",
            }

            -- Configure LLDB adapter
            dap.adapters.gdb = {
                name = "gdb",
                type = "executable",
                command = "/usr/bin/gdb",
                args = { '--quiet', '--interpreter=dap' },
            }

            -- Default debug configuration for C, C++
            dap.configurations.c = {
                {
                    name = "Debug an Executable",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }

            dap.configurations.cpp = dap.configurations.c
            dap.configurations.zig = dap.configurations.c


            -- Override default configurations with `launch.json`
            require("dap.ext.vscode").load_launchjs(".nvim/launch.json", { lldb = { "c", "cpp", "rust" } })


            vim.keymap.set("n", "<Leader>db", require 'dap'.toggle_breakpoint, { desc = "toggle breakpoint" });
            vim.keymap.set("n", "<Leader>do", require 'dap'.step_over, { desc = "step over" });
            vim.keymap.set("n", "<Leader>di", require 'dap'.step_into, { desc = "step into" });
            vim.keymap.set("n", "<Leader>dc", require 'dap'.continue, { desc = "continue" });
            vim.keymap.set("n", "<Leader>dr", require 'dap'.repl.open, { desc = "open repl" });
            vim.keymap.set("n", "<Leader>de", function () 
                require 'dapui'.eval(nil, {enter = true})
            end, { desc = "open repl" });

            dap.listeners.before.attach.dapui_config = function ()
                require'dapui'.open()
            end
            dap.listeners.before.launch.dapui_config = function ()
                require'dapui'.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function ()
                require'dapui'.close()
            end
            dap.listeners.before.event_exited.dapui_config = function ()
                require'dapui'.close()
            end
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio"
        },
        config = function ()
            require'dapui'.setup()
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function ()
            require'nvim-dap-virtual-text'.setup{
                enabled = true,
                virtual_text_pos = 'inline',
            };
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} }, -- already installed
        },
        opts = {
            -- ensure_installed = { "codelldb", "cppdbg", "python" },
            -- automatic_installation = true,
        }
    }
}
