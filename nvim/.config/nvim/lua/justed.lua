-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('media_files')

telescope.setup {
  defaults = {
    prompt_prefix = "(╯°□°）╯ >>> ",
    path_display = { "truncate" },
    dynamic_preview_title = true,
    preview = {
      treesitter = false,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

local justed = {
  mappings = {}
}

--require('gitsigns').setup()


require("indent_blankline").setup {
    char = '▏',
    buftype_exclude = {"terminal"}
}

require('justed_statusline')

  -- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-n>'] = function ()
      if not cmp.visible() then
        cmp.complete()
      else
        cmp.select_next_item()
      end
    end,
    ['<C-p>'] = function ()
      if not cmp.visible() then
        cmp.complete()
      else
        cmp.select_prev_item()
      end
    end,
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      group_index = 1,
      max_item_count = 5,
    },
    {
      name = 'buffer',
      group_index = 1,
      max_item_count = 5,
      --option = {
        --get_bufnrs = function()
          --return vim.api.nvim_list_bufs()
        --end
      --},
    },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'vim-dadbod-completion' },
  })
})

-- TODO: understand how to not show the diagnostics
require'lspconfig'.solargraph.setup{
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        underline = false
      }
    )
  },
  on_attach = function()
    -- remap documentation only for current buffer
    -- second press moves you to the documentation window
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  end
}

require'lspconfig'.rust_analyzer.setup{
  cmd = { "/home/justed/core/apps/rust-analyzer" },
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false
      }
    )
  },
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "ruby", "yaml", "javascript", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    disable = function(lang, buf)
      local max_filesize = 300 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

return justed
