return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
        provider_selector = function()
            return { "lsp", "indent" }
        end,
    },
    config = function(_, opts)
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        require("ufo").setup(opts)
    end,
}
