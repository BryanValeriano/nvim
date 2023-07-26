local palette = require("nordic.colors")
require("nordic").setup({
  transparent_bg = true,
  override = {
    TelescopeNormal = { bg = palette.none },
    TelescopePromptNormal = { bg = palette.none },
    TelescopeResultsNormal = { bg = palette.none },
    TelescopePreviewNormal = { bg = palette.none },
  },
})

vim.cmd("colorscheme nordic")
