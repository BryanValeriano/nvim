local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

require("navigator").setup({
  on_attach = on_attach,
  icons = {
    enable = true,
    diagnostic_err = "✘",
    diagnostic_warn = "",
    diagnostic_info = "",
    diagnostic_hint = "➤",
    diagnostic_virtual_text = "", -- your desired icon
  },
  keymaps = {
    {
      key = "<C-j>",
      func = require("navigator.diagnostics").goto_next,
      desc = "next diagnostics error or fallback",
    },
    {
      key = "zK", -- just to remove the default gD mapping
      func = vim.lsp.buf.declaration,
      desc = "declaration",
    },
    {
      key = "gD",
      func = function()
        vim.cmd("tab split") -- Open a new tab first
        require("navigator.definition").definition()
      end,
      desc = "tabnew definition",
    },
  },
})

local signs = { Error = "✘", Warn = "", Hint = "➤", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
