-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Base functionality
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'svermeulen/vimpeccable'

  -- General quality of life
  use 'airblade/vim-rooter'
  --use 'rstacruz/vim-closer'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-endwise'
  use 'tpope/vim-surround'
  use 'tpope/vim-abolish'
  use 'tpope/vim-repeat'
  use { 'tpope/vim-sexp-mappings-for-regular-people',
        requires = 'guns/vim-sexp',
        after = {'vim-surround', 'vim-repeat'},
      }

  use 'junegunn/vim-easy-align'
  use 'scrooloose/nerdcommenter'
  use { 'andymass/vim-matchup',
        event = 'VimEnter',
        config = get_config('matchup'),
        after = 'nvim-treesitter',
      }

  use { 'luochen1990/rainbow',
        setup = function()
          vim.g.rainbow_active = true
        end,
      }

  -- Utilities
  use { 'scrooloose/nerdtree',
        cmd = 'NERDTreeToggle',
        setup = function()
          vim.g.NERDTreeIgnore = {'node_modules', 'vendor', '.git'}
        end,
      }
  use { 'L3MON4D3/LuaSnip',
        config = get_config('luasnip'),
      }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- Autocomplete
  use { 'hrsh7th/nvim-cmp',
        requires = {
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-path' },
          { 'hrsh7th/cmp-cmdline' },
        },
        config = get_config('autocomplete'),
      }

  -- Language Support
  use { 'dart-lang/dart-vim-plugin', ft = 'dart' }
  use { 'cespare/vim-toml', ft = 'toml' }
  use { 'mattn/emmet-vim', ft = {'html', 'vue', 'css'} }
  use { 'fatih/vim-go', ft = 'go', run = ':GoUpdateBinaries' }
  use { 'wlangstroth/vim-racket', ft = {'rkt', 'rktl'}}
  use { 'jvirtanen/vim-hcl', ft = 'hcl' }

  -- Appearance
  --use { 'rakr/vim-one', opt = true }
  use { 'RRethy/nvim-base16',
         config = function()
            vim.cmd [[colorscheme base16-outrun-dark]]
         end,
      }
  --use { 'mgrubb/vim-colorscheme-thaumaturge', opt = true }
  --use { 'vim-scripts/Relaxed-Green', opt = true }
  --use { 'feline-nvim/feline.nvim', config = get_config('feline'), opt = false }
  use { 'nvim-lualine/lualine.nvim',
        opt = false,
        requires = { 'kyazdani42/nvim-web-devicons', opt = false },
        config = get_config('lualine'),
        after = 'nvim-base16',
      }

end)
