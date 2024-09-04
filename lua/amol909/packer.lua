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
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
	 {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
	{"nvim-treesitter/playground"},
     {"theprimeagen/harpoon"},
	 {"mbbill/undotree"},
	 {"tpope/vim-fugitive"},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},	
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
	       opts = {}
	},
	{"github/copilot.vim"},
	{"windwp/nvim-ts-autotag"},
	{"tpope/vim-commentary"},
	{"tpope/vim-surround"},
	{"nvim-tree/nvim-tree.lua"},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	},
	   {
	   "CopilotC-Nvim/CopilotChat.nvim",
	   branch = "canary",
	   dependencies = {
	     { "github/copilot.vim" }, -- or github/copilot.vim
	   },
	   opts = {
	     debug = true, -- Enable debugging
         show_help = true, -- Show help message on startup
         window = {
        layout = "float",
      },
      auto_follow_cursor = false,
	     -- See Configuration section for rest
	   },
	 },
	{ "kevinhwang91/nvim-ufo",  dependencies= "kevinhwang91/promise-async" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
	{ "folke/trouble.nvim",
	        config= function()
	           require("trouble").setup()
	        end,
	   cmd="Trouble",
	    dependencies= "kyazdani42/nvim-web-devicons" }
})
