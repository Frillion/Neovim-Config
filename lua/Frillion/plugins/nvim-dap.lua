return {
    "rcarriga/nvim-dap-ui",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap"
    },
    config = function()
        local dap_ui = require("dapui")
        local dap = require("dap")
        dap.adapters.gdb = {
          type = "executable",
          command = "gdb",
          args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }
        dap.configurations.c = {
          {
            name = "Launch",
            type = "gdb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
          },
          {
            name = "Select and attach to process",
            type = "gdb",
            request = "attach",
            program = function()
               return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            pid = function()
               local name = vim.fn.input('Executable name (filter): ')
               return require("dap.utils").pick_process({ filter = name })
            end,
            cwd = '${workspaceFolder}'
          },
          {
            name = 'Attach to gdbserver :1234',
            type = 'gdb',
            request = 'attach',
            target = 'localhost:1234',
            program = function()
               return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}'
          },
        }
        dap.configurations.cpp = {
          {
            name = "Launch",
            type = "gdb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
          },
          {
            name = "Select and attach to process",
            type = "gdb",
            request = "attach",
            program = function()
               return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            pid = function()
               local name = vim.fn.input('Executable name (filter): ')
               return require("dap.utils").pick_process({ filter = name })
            end,
            cwd = '${workspaceFolder}'
          },
          {
            name = 'Attach to gdbserver :1234',
            type = 'gdb',
            request = 'attach',
            target = 'localhost:1234',
            program = function()
               return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}'
          },
        }
        dap_ui.setup()

        vim.api.nvim_create_user_command('DapUiToggle', function() require('dapui').toggle() end, { nargs = 0 })

        local keymap = vim.keymap
        keymap.set("n","<leader>dt", "<cmd>DapUiToggle<CR>", {desc = "Toggle debug menu"})
        keymap.set("n","<leader>db", "<cmd>DapToggleBreakpoint<CR>", {desc = "Toggle breakpoint at cursor"})
        keymap.set("n","<leader>dc", "<cmd>DapContinue<CR>", {desc = "Continue execution to the next breakpoint"})
        keymap.set("n","<F10>","<cmd>lua require('dap').step_over()<CR>", {desc = "Step forward in debug mode"})
        keymap.set("n","<F11>","<cmd>DapStepInto<CR>", {desc = "Step into functions in debug mode"})
        keymap.set("n","<leader>dB","<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {desc = "Set conditional breakpoint"})
        keymap.set("n","<leader>dR","<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {desc = "Inspect state with REPL"})
        keymap.set("n","<leader>dr", "<cmd>lua require('dapui').open({ reset = true })<CR>", {desc = "Reset debug UI"})
    end,
}
