return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
        modes = {
            errors = {
                mode = "diagnostics",
                filter = {
                    severity = vim.diagnostic.severity.ERROR,
                    function(item)
                        return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                    end,
                },
            },
        },
    },
    cmd = "Trouble",
    keys = {
    { "<leader>te", "<cmd>Trouble errors toggle<cr>", desc = "Open/close trouble list" },
    { "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble in the current buffer" },
    { "<leader>tq", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble quickfix list" },
  },
}
