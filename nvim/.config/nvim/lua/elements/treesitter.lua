
require('nvim-treesitter.configs').setup {
    ensure_installed = { "ruby", "yaml", "javascript", "lua" },
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = function(_, buf)
            local max_filesize = 300 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
}

require('treesitter-context').setup {
    enable = false,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = nil,
}
