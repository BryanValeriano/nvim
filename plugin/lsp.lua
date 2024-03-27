local lsp = require("lsp-zero")
lsp.preset("recommended")

-- nvim-cmp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true

--lsp.set_preferences({
--	set_lsp_keymaps = { omit = { "gd" } },
--})

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
	bind("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"luau_lsp",
		"eslint",
		"rust_analyzer",
		"gopls",
		"prismals",
	},
})

require("mason-lspconfig").setup_handlers({
	["rust_analyzer"] = function()
		require("rust-tools").setup({
			server = {
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
					print("test Maroto")
				end,
			},
		})
	end,
	["gopls"] = function()
		require("lspconfig")["gopls"].setup({
			cmd = { "gopls", "-remote=auto", "-rpc.trace", "-v" },
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function(fname)
				return require("lspconfig.util").root_pattern("go.mod", ".git")(fname)
					or require("lspconfig.util").path.dirname(fname)
			end,
			-- init_options = {
			-- gofumpt = true,
			--},
			settings = {
				gopls = {
					semanticTokens = true,
					analyses = {
						unusedparams = true,
						nilness = true,
						unusedwrite = true,
					},
					hints = {
						compositeLiteralFields = true,
						parameterNames = true,
					},
					staticcheck = true,
				},
			},
		})
	end,
})

local rust_tools = require("rust-tools")
rust_tools.inlay_hints.enable()
