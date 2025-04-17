require("navigator").setup({
  icons = {
    enable = true,
    diagnostic_err = "✘",
    diagnostic_warn = "",
    diagnostic_info = "",
    diagnostic_hint = "➤",
    diagnostic_virtual_text = "", -- your desired icon
  },
})

local signs = { Error = "✘", Warn = "", Hint = "➤", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
