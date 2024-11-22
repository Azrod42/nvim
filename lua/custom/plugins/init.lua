-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- multi line
  { 'mg979/vim-visual-multi' },
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set({ 'n' }, '<leader>cd', '<cmd>Copilot disable<CR>', { desc = '[C]opilot [D]isable' })
      vim.keymap.set({ 'n' }, '<leader>ce', '<cmd>Copilot enable<CR>', { desc = '[C]opilot [E]nable' })
    end,
  },
  {
    'sindrets/diffview.nvim',
    config = function()
      vim.keymap.set({ 'n' }, '<leader>dm', '<cmd>DiffviewOpen<CR>', { desc = '[D]iff [M]aster' })
      vim.keymap.set({ 'n' }, '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = '[D]iff [C]lose' })
      vim.keymap.set({ 'n' }, '<leader>df', '<cmd>DiffviewFileHistory %<CR>', { desc = '[D]iff [F]ile' })
    end,
  },

  -- autotag (){}html ...
  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html', 'markdown' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  --tag bar to se files content on side pannel
  -- {
  --   'preservim/tagbar',
  --   config = function()
  --     vim.keymap.set({ 'n' }, '<leader>tt', '<cmd>Tagbar<CR>', { desc = '[T]oggle [T]agbar' })
  --   end,
  -- },
}
