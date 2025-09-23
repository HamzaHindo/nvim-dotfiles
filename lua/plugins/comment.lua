return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- lazy load on file open
    config = function()
        require("Comment").setup()
    end,
}
