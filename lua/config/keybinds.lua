vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- In your config (works with toggleterm too)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
for i = 1, 10 do -- change 5 to how many terminals you have
    vim.api.nvim_set_keymap(
        "n",
        "<leader>t" .. i,
        "<cmd>ToggleTerm " .. i .. "<CR>",
        { noremap = true, silent = true }
    )
end
