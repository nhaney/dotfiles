-- Initialize lazy.nvim for plugin management.
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

-- Define all plugins and dependencies here so that they can all be found in a centralized
-- location. All configuration of the plugins are implemented in separate files for each
-- entry in this list.
local plugins = {
	-- Git support.
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = require("user.plugins.git").config,
	},
	-- Treesitter for syntax highlighting and AST parsing.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		opts = require("user.plugins.treesitter").opts,
		config = require("user.plugins.treesitter").config,
	},
	-- Telescope for searching various things inside neovim.
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = require("user.plugins.telescope").config,
	},
	-- Mason for LSP, linter, DAP, etc. management.
	{
		"williamboman/mason.nvim",
		opts = require("user.plugins.mason").opts,
		config = require("user.plugins.mason").config,
	},
	-- LuaSnip for creating snippets.
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {},
	},
	-- nvim-cmp for completion support.
	{
		"hrsh7th/nvim-cmp",
		event = "BufReadPre",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = require("user.plugins.cmp").opts,
		config = require("user.plugins.cmp").config,
	},
	-- LSP support.
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			"nvim-telescope/telescope.nvim",
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
		},
		config = require("user.plugins.lsp").config,
	},
	-- Null-LS for linting and formatting.
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = require("user.plugins.null").config,
	},
	-- Color schemes.
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = require("user.plugins.colorscheme").opts,
		config = require("user.plugins.colorscheme").config,
	},
}

require("lazy").setup(plugins, {
	install = { colorscheme = { "tokyonight" } },
	defaults = { lazy = true },
	checker = { enabled = true },
	debug = true,
})
