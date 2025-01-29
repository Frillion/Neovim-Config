vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- set tab spacing to 4 spaces max
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- Prevent text wrap
vim.wo.wrap = false

-- Allow mouse movement
vim.opt.mouse = 'a'

-- Don't show what mode you're in(status line does that)
vim.opt.showmode = false

-- copy to the system clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

-- Undo history
vim.opt.undofile = true

-- Case sensitive only if capital letter in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

-- This is used for which-key, controls how long untill pop-down
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-c>' , '<ESC>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Move Selected line, keep indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K",":m '<-2<CR>gv=gv")

-- Paste keep register intact
vim.keymap.set("x", "<leader>pa", "\"_dP")

-- Page UP/Down and center
vim.keymap.set("n","<C-d>", "<C-d>zz", { desc = "Jumps one page down and centers the cursor"})
vim.keymap.set("n","<C-u>", "<C-u>zz", { desc = "Jumps one page up and centers the cursor"})

-- Next/Previous search term and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set("n","<C-f>","<cmd>silent !tmux neww tmux_sessionizer_love_ya_prime.sh<cr>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {import = "Frillion.dependency"},
    {import = "Frillion.lsp"},
    {import = "Frillion.plugins"}
})
