return {
    "williamboman/mason.nvim",
    config = function()
        local mason = require("mason")
        mason.setup({
            PATH = "prepend",
          ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
          },
        })
    end
}
