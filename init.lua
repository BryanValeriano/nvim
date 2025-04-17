require("base")
require("highlights")
require("maps")
require("plugins")

vim.opt.clipboard:append({ "unnamedplus" })
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = "/usr/bin/python3"
-- some plugin is setting it to false
vim.wo.number = true
vim.wo.relativenumber = true

_G.get_navic_winbar = function()
  local navic = require("nvim-navic")
  if navic.is_available() then
    return navic.get_location() or ""
  end
  return ""
end

vim.o.winbar = "%{%v:lua.get_navic_winbar()%}"
