require("nvim-web-devicons").setup({
  -- your personal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    go = {
      icon = "󰟓", -- Copy-paste the glyph here
      color = "#00acd7", -- Color from the SVG
      cterm_color = "38",
      name = "GoLang",
    },
  },
  override_by_extension = {
    ["go"] = {
      icon = "󰟓", -- Copy-paste the glyph here
      color = "#00acd7", -- Color from the SVG
      cterm_color = "38",
      name = "GoLang",
    },
  },
})
