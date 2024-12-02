
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/nvim-cmp' },
        { 'neovim/nvim-lspconfig' },
        { 'kristijanhusak/vim-dadbod-completion' },
        -- Errors Lint }
        { 'w0rp/ale' },

        { 'sbdchd/neoformat' },

        -- Telescope
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-telescope/telescope-media-files.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'benfowler/telescope-luasnip.nvim' },

        -- Languages and Frameworks
        { 'noprompt/vim-yardoc' },
        { 'rust-lang/rust.vim' },
        { 'stevearc/vim-arduino' },
        { 'vim-ruby/vim-ruby' },
        { 'pangloss/vim-javascript' },
        { 'JulesWang/css.vim' },
        { 'cakebaker/scss-syntax.vim' },
        { 'digitaltoad/vim-jade' },
        { 'slim-template/vim-slim' },
        { 'kchmck/vim-coffee-script' },
        { 'plasticboy/vim-markdown' },
        { 'tpope/vim-bundler' },
        { 'jparise/vim-graphql' },
        { 'tpope/vim-rails' },
        { 'mxw/vim-jsx' },
        { 'posva/vim-vue' },
        { 'ekalinin/Dockerfile.vim' },

        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp"
        },

        { 'saadparwaiz1/cmp_luasnip' },

        -- git plugins
        { 'tpope/vim-fugitive' },
        { 'airblade/vim-gitgutter' },
        { 'tpope/vim-rhubarb' },
        { 'shumphrey/fugitive-gitlab.vim' },
        { 'wincent/vcs-jump' },
        { 'kristijanhusak/vim-dirvish-git' },
        { 'junegunn/gv.vim' },
        { 'rhysd/git-messenger.vim' },

        -- Database
        { 'tpope/vim-dadbod' },
        { 'kristijanhusak/vim-dadbod-ui' },

        { 'nicwest/vim-http' },

        -- Random Features },
        { 'tpope/vim-surround' },
        { 'tpope/vim-repeat' },
        { 'tpope/vim-abolish' },
        { 'tpope/vim-speeddating' },
        { 'tpope/vim-eunuch' },
        { 'haya14busa/vim-asterisk' },
        { 'tpope/vim-unimpaired' },
        { 'jeetsukumaran/vim-indentwise' },
        { 'andrewradev/splitjoin.vim' },
        { 'scrooloose/nerdcommenter' },
        { 'tpope/vim-endwise' },
        { 'jiangmiao/auto-pairs' },
        { 'kshenoy/vim-signature' },
        { 'lukas-reineke/indent-blankline.nvim' },
        { 'junegunn/vim-easy-align' },
        { 'machakann/vim-highlightedyank' },
        { 'markonm/traces.vim' },
        { 'nvim-treesitter/nvim-treesitter-context' },

        -- File Browsing
        { 'justinmk/vim-dirvish' },
        { 'ryanoasis/vim-devicons' },
        { 'kyazdani42/nvim-web-devicons' },
        { 'kevinhwang91/rnvimr' },
        { 'ThePrimeagen/harpoon' },

        -- UI
        {
            'sainnhe/gruvbox-material',
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme gruvbox-material]])
            end,
        },

        { 'luisiacc/gruvbox-baby', branch = 'main' },

        { "EdenEast/nightfox.nvim" },

        { 'junegunn/vim-emoji' },
        { 'hoob3rt/lualine.nvim' },

        -- System Integration
        { 'wincent/terminus' },
        { 'embear/vim-localvimrc' },

        { 'wincent/ferret' },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    --install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})
