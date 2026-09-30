vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'http' },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.preserveindent = false
    vim.opt_local.relativenumber = false
  end,
})

-- REST api
-- need sudo apt install luarocks
return {
  {
    'mistweaverco/kulala.nvim',
    -- v6.32.0+ downloads kulala-core and prompts for a paid license token; stay on the last release without it
    version = '6.31.1',
    ft = 'http',
    keys = {
      { '<leader>r', '', desc = '  Rest' },
      { '<leader>rr', "<cmd>lua require('kulala').run()<cr>", desc = 'Send the request' },
      { '<leader>rs', "<cmd>lua require('kulala').run()<cr>", desc = 'Send the request' },
    },
    opts = {
      ui = {
        split_direction = 'horizontal',
        win_opts = {
          height = 25,
        },
      },
    },
  },

  {
    'hudclark/grpc-nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>rg', '<cmd>Grpc<cr>', desc = 'Send grpc the request' },
    },
  },
}
