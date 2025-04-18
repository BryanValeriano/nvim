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
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },

  -- Snippet Collection (Optional)
  -- { "rafamadriz/friendly-snippets" },

  "j-hui/fidget.nvim",        -- progress ui

  "nvim-lualine/lualine.nvim", -- Statusline
  "nvim-lua/plenary.nvim",    -- Common utilities
  "onsails/lspkind-nvim",     -- vscode-like pictograms

  {
    "nvimtools/none-ls.nvim", -- Use Neovim name a language server to inject LSP diagnostics, code actions, and more via Lua
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-context",

  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "akinsho/nvim-bufferline.lua",
  "norcalli/nvim-colorizer.lua",
  {
    "ray-x/navigator.lua", -- LSP UI
    dependencies = {
      { "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
  },
  "SmiteshP/nvim-navic",
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

  -- syntax highlight for thrift
  "solarnz/thrift.vim",

  -- rust
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- debug
  "mfussenegger/nvim-dap",
  { "rcarriga/nvim-dap-ui",            dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

  -- copilot
  "github/copilot.vim",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                    -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                       -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  -- avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- or "*" if you prefer the latest release
    build = "make", -- or the appropriate Windows build command

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- Optional dependencies
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- codecompanion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- colorschemes
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  "rebelot/kanagawa.nvim",
  "AlexvZyl/nordic.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  "NLKNguyen/papercolor-theme",
  { "catppuccin/nvim",  name = "catppuccin" },
  "tiagovla/tokyodark.nvim",
  --"JoosepAlviste/palenightfall.nvim",
  "marko-cerovac/material.nvim",
  "Mofiqul/dracula.nvim",
  { "EdenEast/nightfox.nvim" },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
