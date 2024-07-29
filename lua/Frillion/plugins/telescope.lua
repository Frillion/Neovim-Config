return {
    "nvim-telescope/telescope.nvim",
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
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap
	local builtin = require("telescope.builtin")

	keymap.set("n", "<leader>pg", builtin.git_files, {desc = "Fuzzy find only files that are tracked by git"})
        keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Fuzzy find files in cwd"})
	keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Fuzzy find help pages"})
        keymap.set("n", "<leader>psw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({search = word})
		end, {desc = "Find (w)word under cursor in cwd"})
        keymap.set("n", "<leader>psW", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({search = word})
		end, {desc = "Find (W)word under cursor in cwd"})
    end,
}
