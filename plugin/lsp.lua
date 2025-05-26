vim.opt.signcolumn = "yes"

local lspconfig = require("lspconfig")

-- Capabilities
local capabilities = vim.tbl_deep_extend(
  "force",
  lspconfig.util.default_config.capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)

-- Shared on_attach function
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  -- using navigator now -- see navigator.rc.lua
  -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  -- vim.keymap.set("n", "gC", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  -- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
  -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  -- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  -- vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  -- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  -- vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  -- vim.keymap.set("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

--- Setup LSP autocommand - ensure this still calls your modified on_attach
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      on_attach(client, event.buf)
    end
  end,
})

-- Mason and handlers
require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "ts_ls",
    "lua_ls",
    "eslint",
    "rust_analyzer",
    "gopls",
    "prismals",
    "thriftls",
    "pyright",
  },
  handlers = {
    ["thriftls"] = function()
      lspconfig.thriftls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    ["gopls"] = function()
      lspconfig.gopls.setup({
        cmd = { "gopls", "-remote=auto", "-rpc.trace", "-v" },
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("go.mod", ".git")(fname)
              or require("lspconfig.util").path.dirname(fname)
        end,
        init_options = {
          staticcheck = true,
        },
        flags = {
          debounce_text_changes = 1000,
        },
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
          },
        },
      })
    end,
    ["ts_ls"] = function()
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    ["clangd"] = function()
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    ["pyright"] = function()
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
})
