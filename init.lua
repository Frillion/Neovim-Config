vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- set tab spacing to 4 spaces max
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set("n","<leader>nh", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "<C-c>", "<ESC>")

-- [[ Editing Keymaps ]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K",":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>pa", "\"_dP")


-- [[ Navigation Keymaps ]]
-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n","<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n","<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n","<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n","<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n","<C-d>", "<C-d>zz", { desc = "Jumps one page down and centers the cursor"})
vim.keymap.set("n","<C-u>", "<C-u>zz", { desc = "Jumps one page up and centers the cursor"})
vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")
vim.keymap.set("n","<leader>qn","<cmd>cnext<cr>")
vim.keymap.set("n","<leader>qp","<cmd>cprev<cr>")
vim.keymap.set("n","<C-f>","<cmd>silent !tmux neww tmux_sessionizer_love_ya_prime.sh<cr>")
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n","<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n","<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n","<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n","<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n","<leader>sv", "<C-w>v", { desc = "Splits window vertically using same buffer"})
vim.keymap.set("n","<leader>sh", "<C-w>s", { desc = "Splits window horizontally using same buffer"})
vim.keymap.set("n","<leader>sx", "<C-w>q", { desc = "Splits window horizontally using same buffer"})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-fugitive",
	import = "Frillion.plugins"})

