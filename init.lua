require('config.options')
require('config.keybinds')
require('config.lazy')

-- Set transparent background
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
]]
vim.cmd [[
  highlight CursorLine guibg=#1a1a1a
  highlight CursorLineNr guifg=#ffaa00 guibg=#1a1a1a gui=bold
]]
