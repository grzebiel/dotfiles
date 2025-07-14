require('dapui').setup()
-- vim.cmd([[nnoremap <c-u> :lua require('dapui').toggle()<cr>]])


local dap = require('dap')

-- Python
dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            return '/usr/bin/python';
        end;
    },
}


-- Zig, C, C++, rust

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
    args = {'--quiet', '--interpreter=dap'},
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
dap.configurations.rust = dap.configurations.c
dap.configurations.zig = dap.configurations.c

-- Override default configurations with `launch.json`
require("dap.ext.vscode").load_launchjs(".nvim/launch.json", { lldb = { "c", "cpp", "rust" } })
