-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Mange itself
  use 'wbthomason/packer.nvim'


  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  -- autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'github/copilot.vim'
  -- use 'zbirenbaum/copilot.lua'
  -- use 'zbirenbaum/copilot-cmp'
  use 'neovim/nvim-lspconfig'
  use 'kristijanhusak/vim-dadbod-completion'


  -- Errors
  use 'w0rp/ale'


  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  -- Languages and Frameworks
  use 'noprompt/vim-yardoc'
  use 'rust-lang/rust.vim'
  use 'stevearc/vim-arduino'
  use 'vim-ruby/vim-ruby'
  use 'pangloss/vim-javascript'
  use 'JulesWang/css.vim'
  use 'cakebaker/scss-syntax.vim'
  use 'digitaltoad/vim-jade'
  use 'slim-template/vim-slim'
  use 'kchmck/vim-coffee-script'
  use 'plasticboy/vim-markdown'
  use 'tpope/vim-bundler'
  use 'jparise/vim-graphql'
  use 'tpope/vim-rails'
  use 'mxw/vim-jsx'
  use 'posva/vim-vue'
  use 'ekalinin/Dockerfile.vim'


  -- git plugins
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-rhubarb' -- required for :Gbrowse for GitHub
  use 'wincent/vcs-jump'
  use 'kristijanhusak/vim-dirvish-git'


  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'


  -- Random Features
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-eunuch'
  use 'haya14busa/vim-asterisk'
  use 'tpope/vim-unimpaired'
  use 'jeetsukumaran/vim-indentwise'
  use 'andrewradev/splitjoin.vim'
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-endwise'
  use 'jiangmiao/auto-pairs'
  use 'kshenoy/vim-signature' -- Display marks(a-z, A-Z) near numbers
  use 'lukas-reineke/indent-blankline.nvim'
  use 'junegunn/vim-easy-align'
  use 'machakann/vim-highlightedyank'
  use 'markonm/traces.vim'


  -- File Browsing
  use 'justinmk/vim-dirvish'
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'kevinhwang91/rnvimr'
  use 'ThePrimeagen/harpoon'


  -- UI
  use 'sainnhe/gruvbox-material'

  use { 'luisiacc/gruvbox-baby', branch = 'main' }
  use "EdenEast/nightfox.nvim"


  use 'junegunn/vim-emoji'
  use 'hoob3rt/lualine.nvim'


  -- System Integration
  use 'wincent/terminus' -- Terminal improvements
  use 'lyokha/vim-xkbswitch'
  use 'embear/vim-localvimrc'


  -- Search & Replace
  use 'wincent/ferret'
end)
