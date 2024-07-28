return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre","BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
            },

            indent = {
                enable = true
            },
            autotag = {
                enable = true
            },
            ensure_installed = {
                "go",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                "graphql",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "c",
                "python",
                "c_sharp",
                "bash",
                "cpp",
                "git_config",
                "vue",
                "sql",
                "rust",
                "requirements",
                "regex",
                "bash"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end
}
