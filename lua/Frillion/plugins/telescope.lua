return {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                path_display = {"smart"},

                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next
                    }
                }
            }
        })

        telescope.load_extension("fzf")

        local builtins = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", function()
                builtins.find_files({hidden = true}) 
            end,
            {desc = "Finds files in the CWD"})

        vim.keymap.set("n", "<leader>psw", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({search = word})
            end,
            {desc = "Find (w)word under cursor in cwd"})

        vim.keymap.set("n", "<leader>psW", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({search = word})
            end, 
            {desc = "Find (W)word under cursor in cwd"})
    end
}
