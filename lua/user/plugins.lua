local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

	-- Colour schemes
	"folke/tokyonight.nvim",

	-- LSP
	{
		"neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
	    -- Completions
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
      }
    end,
	},
	"RRethy/vim-illuminate",

	"nvim-telescope/telescope.nvim",

	-- ts
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Autopairs closes braces
	"windwp/nvim-autopairs",

	-- git annotations
	"lewis6991/gitsigns.nvim",

	-- nvim-tree
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",

	-- bufferline
	"ThePrimeagen/harpoon",

	-- lualine
	"nvim-lualine/lualine.nvim",

  -- was causing so many issues
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --     }
  -- },

	"folke/which-key.nvim",

	-- Mini icons for which-key
	{ "nvim-mini/mini.nvim", version = false },
	{ "nvim-mini/mini.icons", version = false },

	"MunifTanjim/prettier.nvim",

	-- folding
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

	-- html tag closing
	"windwp/nvim-ts-autotag",
})
