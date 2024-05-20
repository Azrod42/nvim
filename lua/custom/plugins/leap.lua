return {
  'ggandor/leap.nvim',
  config = function()
    local leap = require 'leap'
    leap.add_default_mappings()
    leap.opts.case_sensitive = true

    vim.keymap.set({ 'n', 'x', 'o', 'v' }, 't', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o', 'v' }, 'T', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o', 'v' }, 'ts', '<Plug>(leap-from-window)')

    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white',
      bold = true,
      nocombine = true,
    })

    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
      fg = 'red',
      bold = true,
      nocombine = true,
    })
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
      fg = 'blue',
      bold = true,
      nocombine = true,
    })
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
  end,
}
