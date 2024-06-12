local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- Snippet Collection (Optional)
			{ "rafamadriz/friendly-snippets" },
		},
	},

	"j-hui/fidget.nvim", -- progress ui

	"nvim-lualine/lualine.nvim", -- Statusline
	"nvim-lua/plenary.nvim", -- Common utilities
	"onsails/lspkind-nvim", -- vscode-like pictograms
	"jose-elias-alvarez/null-ls.nvim", -- Use Neovim name a language server to inject LSP diagnostics, code actions, and more via Lua

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"akinsho/nvim-bufferline.lua",
	"norcalli/nvim-colorizer.lua",
	"kkharji/lspsaga.nvim", -- nightly
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	"f-person/git-blame.nvim",
	"xiyaowong/transparent.nvim",

	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- rust
	"simrat39/rust-tools.nvim",

	-- debug
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

	-- copilot
	"github/copilot.vim",

	-- colorschemes
	"ellisonleao/gruvbox.nvim",
	"folke/tokyonight.nvim",
	"rebelot/kanagawa.nvim",
	"AlexvZyl/nordic.nvim",
	{ "rose-pine/neovim", name = "rose-pine" },
	"NLKNguyen/papercolor-theme",
	{ "catppuccin/nvim", name = "catppuccin" },
	"tiagovla/tokyodark.nvim",
	--"JoosepAlviste/palenightfall.nvim",
	"marko-cerovac/material.nvim",
	"Mofiqul/dracula.nvim",
	{ "EdenEast/nightfox.nvim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
