
local telescope = require('telescope')
telescope.load_extension('fzf')
telescope.load_extension('media_files')

telescope.setup {
    defaults = {
        prompt_prefix = "(╯°□°）╯ >>> ",
        path_display = { "truncate" }, dynamic_preview_title = true,
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

telescope.load_extension('luasnip')

