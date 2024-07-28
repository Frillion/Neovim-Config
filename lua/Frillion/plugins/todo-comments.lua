return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")
        local keymaps = vim.keymap

        keymaps.set("n","[t", function()
            todo_comments.jump_next()
        end,{ desc = "Jump next todo comment"})
        keymaps.set("n","]t", function()
            todo_comments.jump_prev()
        end, { desc = "Jump prev todo comment." })
        todo_comments.setup()
    end
}
