local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.set_preferences({
	set_lsp_keymaps = { omit = { "gd" } },
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local bind = vim.keymap.set
	bind("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
end)

lsp.setup()
