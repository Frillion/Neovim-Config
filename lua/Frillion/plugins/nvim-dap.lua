return {
    "rcarriga/nvim-dap-ui",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap"
    },
    config = function()
        local dap_ui = require("dapui")
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
