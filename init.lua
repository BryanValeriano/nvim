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

-- winbar
local navic = require("nvim-navic")
function NavicWithOffset()
  if navic.is_available() then
    -- Adjust spaces as desired
    local offset = "    " -- four spaces on the left
    return offset .. navic.get_location()
  else
    return ""
  end
end

vim.wo.winbar = "%{%v:lua.NavicWithOffset()%}"
