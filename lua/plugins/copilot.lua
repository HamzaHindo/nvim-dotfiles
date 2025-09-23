-- lua/plugins/copilot.lua
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false }, -- disable ghost text (we use cmp instead)
            panel = { enabled = false },      -- disable side panel
            filetypes = {
                cpp = true,
                c = true,
                python = true,
                javascript = true,
                typescript = true,
                lua = true,
                ["*"] = true, -- enable for all filetypes by default
            },
        })
    end,
}
