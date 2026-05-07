return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "lua",
            "python",
            "cpp",
            "c",
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "yaml",
            "bash",
            "vimdoc",
            "markdown",
            "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
