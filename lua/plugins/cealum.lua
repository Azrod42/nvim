local M = {}

M.setup = function()
  local cealum = require 'cealum'
  print 'Setting up Cealum...'
  cealum.setup {
    -- Your configuration here
    -- For example:
    -- colorscheme = "gruvbox",
  }
end

return M
