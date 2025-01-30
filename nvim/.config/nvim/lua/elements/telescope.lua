
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
        aerial = {
            -- Set the width of the first two columns (the second
            -- is relevant only when show_columns is set to 'both')
            col1_width = 4,
            col2_width = 30,
            -- How to format the symbols
            format_symbol = function(symbol_path, filetype)
                if filetype == "json" or filetype == "yaml" then
                    return table.concat(symbol_path, ".")
                else
                    return symbol_path[#symbol_path]
                end
            end,
            -- Available modes: symbols, lines, both
            show_columns = "both",
        },
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

