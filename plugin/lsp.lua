vim.opt.signcolumn = "yes"
local lspconfig = require("lspconfig")

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
	"force",
	lspconfig.util.default_config.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

-- Executes the callback function every time a
-- language server is attached to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gC", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
	end,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"luau_lsp",
		"eslint",
		"rust_analyzer",
		"gopls",
		"prismals",
		"thriftls",
	},
})

require("mason-lspconfig").setup_handlers({
	["thriftls"] = function()
		require("lspconfig").thriftls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["rust_analyzer"] = function()
		require("rust-tools").setup({
			server = {
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
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
	["ts_ls"] = function()
		require("lspconfig")["ts_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})

local rust_tools = require("rust-tools")
rust_tools.inlay_hints.enable()
