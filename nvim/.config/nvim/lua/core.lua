local M = {
    mappings = {}
}

--require "lsp_signature".setup({})

require("aerial").setup({
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt.expandtab = false
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.tabstop = 2
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
