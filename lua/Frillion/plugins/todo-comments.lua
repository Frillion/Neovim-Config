return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local todo_comments = require("todo-comments")

        vim.keymap.set("n","[t", function()
            todo_comments.jump_next()
        end,{ desc = "Jump next todo comment"})
        vim.keymap.set("n","]t", function()
            todo_comments.jump_prev()
        end, { desc = "Jump prev todo comment." })
        todo_comments.setup()
    end
}
