vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use 'bfredl/nvim-luadev'

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

  use 'junegunn/vim-easy-align'
  use 'mrjones2014/nvim-ts-rainbow'
  use { 'kylechui/nvim-surround', tag = '*' }
  use 'numToStr/Comment.nvim'
  use 'andymass/vim-matchup'
  use 'windwp/nvim-autopairs'

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- Color theme experiments
  use 'EdenEast/nightfox.nvim'
  use 'ray-x/aurora'
  use 'ray-x/starry.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'yashguptaz/calvera-dark.nvim'
  use 'nxvu699134/vn-night.nvim'
  use {'catppuccin/nvim', as = 'catppuccin' }
  use 'bluz71/vim-nightfly-colors'

  use 'nvim-orgmode/orgmode'

end)

