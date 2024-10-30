-- Function to enable transparent background and Gruvbox Material settings with further customization
local function enable_transparency_and_gruvbox_material()
	-- Set the colorscheme to gruvbox-material
	vim.cmd("colorscheme gruvbox-material")

	-- Gruvbox Material specific settings
	vim.g.gruvbox_material_background = "soft" -- Can also be 'medium' or 'hard'
	vim.g.gruvbox_material_better_performance = 1 -- Improve performance
	vim.g.gruvbox_material_enable_italic = true -- Enable italic font
	vim.g.gruvbox_material_palette = "material" -- Use pastel-like color palette

	-- Enable terminal colors and other formatting options
	vim.g.gruvbox_material_terminal_colors = true
	vim.g.gruvbox_material_undercurl = true
	vim.g.gruvbox_material_underline = true
	vim.g.gruvbox_material_bold = true
	vim.g.gruvbox_material_transparent_background = 1 -- Enable transparent mode

	-- Override specific highlight groups with pastel-like colors
	-- vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = "#e0c68c", italic = true }) -- Pastel Khaki
	-- vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "#b16286" }) -- Softer magenta
	-- vim.api.nvim_set_hl(0, "@method.call", { fg = "#b16286" }) -- Softer magenta
	-- vim.api.nvim_set_hl(0, "@function.method.call.go", { fg = "#b16286" }) -- Softer magenta for Go methods
	-- vim.api.nvim_set_hl(0, "@function.method.go", { fg = "#b16286" }) -- Softer magenta for Go methods
	-- vim.api.nvim_set_hl(0, "@lsp.type.string.go", { fg = "#fe8019" })

	-- Enable transparent background
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

	-- Make nvim-tree background transparent
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
end

-- Set this to true to enable the transparent background and theme settings
local enable = false

-- Only execute the function if 'enable' is set to true
if enable then
	enable_transparency_and_gruvbox_material()
end
