local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-n>'] = function()
            if not cmp.visible() then
                cmp.complete()
            else
                cmp.select_next_item()
            end
        end,
        ['<C-p>'] = function()
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
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        {
            name = 'custom_source',
            group_index = 1,
            max_item_count = 5,
        },
        {
            name = 'nvim_lsp',
            group_index = 1,
            max_item_count = 5,
        },
        {
            name = 'buffer',
            group_index = 1,
            max_item_count = 5,
            option = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end
            },
        },
        {
            name = 'luasnip',
            priority = 2
        },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'vim-dadbod-completion' },
    })
})
