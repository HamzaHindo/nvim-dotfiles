return {
    "echasnovski/mini.surround",
    version = "*",
    event = "BufReadPre",
    config = function()
        require("mini.surround").setup()
    end,
}
