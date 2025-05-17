-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- waka-time
  { 'wakatime/vim-wakatime', lazy = false },

  -- multi line
  { 'mg979/vim-visual-multi' },

  {
    'github/copilot.vim',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
      vim.keymap.set({ 'n' }, '<leader>cd', '<cmd>Copilot disable<CR>', { desc = '[C]opilot [D]isable' })
      vim.keymap.set({ 'n' }, '<leader>ce', '<cmd>Copilot enable<CR>', { desc = '[C]opilot [E]nable' })
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    cmd = 'LazyDev',
    opts = {
      dependencies = {
        -- Manage libuv types with lazy. Plugin will never be loaded
        { 'Bilal2453/luvit-meta', lazy = true },
      },
      library = {
        { path = '~/Documents/avante.nvim/lua', words = { 'avante' } },
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },

  -- {
  --   'sindrets/diffview.nvim',
  --   config = function()
  --     vim.keymap.set({ 'n' }, '<leader>dm', '<cmd>DiffviewOpen<CR>', { desc = '[D]iff [M]aster' })
  --     vim.keymap.set({ 'n' }, '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = '[D]iff [C]lose' })
  --     vim.keymap.set({ 'n' }, '<leader>df', '<cmd>DiffviewFileHistory %<CR>', { desc = '[D]iff [F]ile' })
  --   end,
  -- },
}
