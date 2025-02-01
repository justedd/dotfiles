vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<CR>",
    "<cmd>lua require('kulala').run()<cr>",
    { noremap = true, silent = true, desc = "Execute the request" }
)


vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>i",
    "<cmd>lua require('kulala').inspect()<cr>",
    { noremap = true, silent = true, desc = "Inspect the current request" }
)

vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>t",
    "<cmd>lua require('kulala').toggle_view()<cr>",
    { noremap = true, silent = true, desc = "Toggle between body and headers" }
)
