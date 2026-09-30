--[[
alias nvi='NVIM_APPNAME="nvimomied" nvim'
=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
--]]

-- Explicitly declare local alias for global vim to satisfy linters
local vim = vim
-- Disable legacy remote providers we do not use to keep :checkhealth clean.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- Default indentation: 2 spaces, expand tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Split navigation (<C-h/j/k/l>) is handled by vim-tmux-navigator (lua/custom/tmux-navigator.lua)
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Filetypes Neovim doesn't detect on its own (go.work and *.http are built in)
vim.filetype.add {
  extension = {
    gotmpl = 'gotmpl',
  },
}

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Lazy setup
require('lazy').setup({
  rocks = {
    hererocks = true,
  },

  { 'NMAC427/guess-indent.nvim', opts = {} },

  -- require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- Plugin files
  { import = 'plugins' },
  { import = 'custom' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local map = vim.keymap.set
local buffer = require 'utils.buffer'

-- Substitute the word under the cursor
map({ 'n' }, '<leader>cw', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = '[C]hange [W]ord in file' })
-- Close buffer
map({ 'n' }, '<leader>x', buffer.close_current_buffer, { desc = 'Close buffer' })
-- Create new vertical buffer
map({ 'n' }, '<leader>wb', '<cmd>vs<CR>', { desc = 'New [W]orkspace [B]uffer' })
--Screenshot with carbon now
map({ 'v' }, '<leader>cs', ':CarbonNow<CR>', { desc = '[C]ode [S]creenshot with carbon now' })
-- Resize window (Ctrl + arrows, so the built-in <C-w>, <C-d>, <C-a>, <C-s> keep working)
map({ 'n' }, '<C-Right>', '<cmd>vertical resize +5<CR>', { desc = 'Window width +5' })
map({ 'n' }, '<C-Left>', '<cmd>vertical resize -5<CR>', { desc = 'Window width -5' })
map({ 'n' }, '<C-Up>', '<cmd>resize +3<CR>', { desc = 'Window height +3' })
map({ 'n' }, '<C-Down>', '<cmd>resize -3<CR>', { desc = 'Window height -3' })
-- Quickfix list: use the built-in ]q / [q (Neovim 0.11+)

--------------
--- MACROS ---
--------------
-- This allow to use ' .. esc .. ' in the macro to replace ^[
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Set macro registers after ShaDa is loaded so they are not overwritten',
  group = vim.api.nvim_create_augroup('custom-macros', { clear = true }),
  callback = function()
    local esc = vim.api.nvim_replace_termcodes('<esc>', true, true, true)
    vim.fn.setreg('p', "yoconsole.log('" .. esc .. "pa'," .. esc .. 'pa);' .. esc .. 'I' .. esc .. '')
  end,
})

-- vim: ts=2 sts=2 sw=2 et
