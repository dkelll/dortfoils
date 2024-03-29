-- stuff
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

	-- find my fuzzies
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Color themes
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ 'folke/tokyonight.nvim' })
    use({ 'catppuccin/nvim', as = 'catppuccin' })
    use({'EdenEast/nightfox.nvim', as = 'nightfox'})
    use('gruvbox-community/gruvbox')
    use({'lunarvim/darkplus.nvim', as = 'darkplus'})
    use({'nyoom-engineering/oxocarbon.nvim', as = 'oxocarbon'})

	-- Highlighting my syntaxes, Mommyyyyyyy
	use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
	use("nvim-treesitter/playground")

    -- learn to vim like a champ
    use('ThePrimeagen/vim-be-good')

	-- Jump between files with all the speeds, like when savtah gives the 
	-- kids candy before sending them back home
	use({"ThePrimeagen/harpoon", branch = 'harpoon2', requires = {"nvim-lua/plenary.nvim" }})

	-- Track your undo history like a champ
	use('mbbill/undotree')

	-- git fun in (neo)vim
	use('tpope/vim-fugitive')

	-- LSP quickstart (with 'lsp-zero'); WELL worth it
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

    use("eandrju/cellular-automaton.nvim")

end)
