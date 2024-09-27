require("lspsaga").setup({
	ui = {
		winbar_prefix = " ",
	},
	border = "rounded",
	lightbulb = {
		enable = false,
	},
	outline = {
		left_width = 2,
	},
})

local signs = { Error = "✘", Warn = "", Hint = "➤ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>")
vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>")
vim.keymap.set("n", "gp", "<cmd>Lspsaga preview_definition<CR>")
--vim.keymap.set( gr <Cmd>Lspsaga rename<CR>
-- nnoremap <silent> <C-a> <Cmd>Lspsaga code_action<CR>
-- nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
