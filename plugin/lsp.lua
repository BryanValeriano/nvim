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
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr, remap = false }
	local bind = vim.keymap.set
	bind("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
end)

lsp.ensure_installed({
	-- Replace these with whatever servers you want to install
	"tsserver",
	"luau_lsp",
	"eslint",
	"rust_analyzer",
	"gopls",
	"prismals",
})

lsp.skip_server_setup({ "rust_analyzer" })
lsp.setup()

local rust_tools = require("rust-tools")
rust_tools.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
			print("test Maroto")
		end,
	},
})
rust_tools.inlay_hints.enable()
