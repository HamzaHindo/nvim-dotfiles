return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 20,
            open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl+\
            shade_terminals = true,
            direction = "float",      -- float | horizontal | vertical | tab
            start_in_insert = true,
        }

        -- Setup custom terminal for NestJS
        local Terminal = require("toggleterm.terminal").Terminal

        local nestjs = Terminal:new({
            cmd = "npm run start:dev", -- what to run
            hidden = true,
            direction = "float",
        })

        function _NESTJS_TOGGLE()
            nestjs:toggle()
        end

        function _NESTJS_START()
            nestjs:spawn() -- starts the process, but doesn’t show it
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle default terminal" })
        vim.keymap.set("n", "<leader>nb", _NESTJS_START, { desc = "Start NestJS in background" })
        vim.keymap.set("n", "<leader>ns", _NESTJS_TOGGLE, { desc = "Toggle NestJS terminal" })
    end,
}
