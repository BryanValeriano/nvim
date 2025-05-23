-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    ["@lsp.type.interface"] = { fg = "#f0e68c", italic = true, bold = true },
    ["@lsp.type.function"] = { fg = "#b16286", bold = true },

    ["@method.call"] = { fg = "#b16286", bold = true },
    ["@type.method"] = { fg = "#b16286", bold = true },

    -- go
    ["@lsp.type.method.go"] = { fg = "#b16286", bold = true },
    ["@function.method.call.go"] = { fg = "#b16286", bold = true },
    ["@function.method.go"] = { fg = "#b16286", bold = true },
    ["@method.call.go"] = { fg = "#b16286", bold = true },

    -- typescript
    ["@lsp.type.method.typescript"] = { fg = "#b16286", bold = true },
    ["@function.method.call.typescript"] = { fg = "#b16286", bold = true },
    ["@function.method.typescript"] = { fg = "#b16286", bold = true },
    ["@method.call.typescript"] = { fg = "#b16286", bold = true },

    ["@lsp.type.method"] = { fg = "#b16286", bold = true },
  },
  dim_inactive = false,
  transparent_mode = true,
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")
