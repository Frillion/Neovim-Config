return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

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
        mason_lspconfig.setup({
            ensure_installed = {
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "graphql",
                "emmet_ls",
                "prismals",
                "pyright",
                "golangci_lint_ls",
                "eslint",
                "dockerls",
                "clangd",
                "bashls",
                "jsonls",
                "rust_analyzer",
                "sqlls",
            }
        })
        mason_tool_installer.setup({})
    end,
}
