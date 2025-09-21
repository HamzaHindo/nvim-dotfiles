return {
    "jmbuhr/telescope-toggleterm.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("toggleterm")

        -- keymap
        vim.keymap.set("n", "<leader>tl", "<cmd>Telescope toggleterm<CR>", { desc = "List terminals" })
    end,
}
