return {
  {
    dir = './cealum.lua',
    dev = true,
    config = function()
      require('cealum').setup()
    end,
  },
}
