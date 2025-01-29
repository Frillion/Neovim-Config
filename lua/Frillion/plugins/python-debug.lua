return {
    "mfussenegger/nvim-dap-python",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local dap_python = require("dap-python")

        dap_python.setup("~/.virtualenvs/debugpy/bin/python")
    end,
}
