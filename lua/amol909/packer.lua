-- Using lazy nvim instead of packer

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground" },
	{ "github/copilot.vim" },
	{ "theprimeagen/harpoon" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{ "windwp/nvim-ts-autotag" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	--{
	--	"folke/snacks.nvim",
	--	priority = 1000,
	--	lazy = false,
	--	---@type snacks.Config
	--	opts = {
	--		animate = { enabled = false },
	--		-- your configuration comes here
	--		-- or leave it empty to use the default settings
	--		-- refer to the configuration section below
	--		bigfile = { enabled = true },
	--		dashboard = { enabled = true },
	--		explorer = { enabled = false },
	--		indent = { enabled = true },
	--		input = { enabled = true },
	--		picker = { enabled = true },
	--		notifier = { enabled = true },
	--		quickfile = { enabled = true },
	--		scope = { enabled = true },
	--		scroll = { enabled = true },
	--		statuscolumn = { enabled = true },
	--		words = { enabled = true },
	--	},
	--},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
		cmd = "Trouble",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
})
