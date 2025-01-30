local M = {
    mappings = {}
}

require("aerial").setup({
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})

require('elements.telescope')
require('elements.indent_line')
require('elements.statusline')
require('elements.snippets')
require('elements.cmp')
require('elements.lsp')
require('elements.treesitter')


return M
