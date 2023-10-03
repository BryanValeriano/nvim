local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
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
	})

	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("akinsho/nvim-bufferline.lua")
	use("norcalli/nvim-colorizer.lua")
	use({ "kkharji/lspsaga.nvim" }) -- nightly
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("f-person/git-blame.nvim")
	use("ThePrimeagen/harpoon")
	use("xiyaowong/transparent.nvim")

	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- rust
	use("simrat39/rust-tools.nvim")

	--debug
	use("mfussenegger/nvim-dap")
	--use("leoluz/nvim-dap-go")

	-- colorschemes
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")
	use("AlexvZyl/nordic.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("NLKNguyen/papercolor-theme")
end)
