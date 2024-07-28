return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		-- OR setup with some options
		nvimtree.setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 40,
                relativenumber = true
            },
            renderer = {
                indent_markers = {
                  enable = true,
                },
                icons = {
                  glyphs = {
                    folder = {
                              arrow_closed = "", -- arrow when folder is closed
                              arrow_open = "", -- arrow when folder is open
                            },
                        },
                },
            },

            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },
        })

		local keymap = vim.keymap

		keymap.set("n","<leader>ee","<cmd>NvimTreeToggle<CR>", {desc = "Toggles the directory tree on and off"})
		keymap.set("n","<leader>ef","<cmd>NvimTreeFindFileToggle<CR>", {desc = "Toggles the tree at the current file"})
		keymap.set("n","<leader>ec","<cmd>NvimTreeCollapse<CR>", {desc = "Collapses all folders centered on the cursor"})
		keymap.set("n","<leader>er","<cmd>NvimTreeRefresh<CR>", {desc = "Refreshes the tree"})
	end
}
