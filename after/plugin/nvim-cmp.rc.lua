-- Make sure you setup `cmp` after lsp-zero

local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
})
