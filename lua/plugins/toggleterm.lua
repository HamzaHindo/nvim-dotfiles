return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup {
            size = 20,
            open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl+\
            shade_terminals = true,
            direction = "float",      -- float | horizontal | vertical | tab
            start_in_insert = true,
        }

        local Terminal = require("toggleterm.terminal").Terminal

        -- Terminal to run the current C++ file
        local cpp_runner = Terminal:new({
            cmd = "",
            hidden = true,
            direction = "float",
            close_on_exit = false,
        })

        function _RUN_CPP()
            vim.cmd("write")                    -- Save the current buffer
            local file = vim.fn.expand("%")     -- current file path
            local output = vim.fn.expand("%:r") -- filename without extension
            local cmd = string.format("g++ -std=c++17 %s -o %s && ./%s", file, output, output)

            cpp_runner.cmd = cmd
            cpp_runner:toggle()
        end

        -- Keymaps
        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle default terminal" })
        vim.keymap.set("n", "<leader>r", _RUN_CPP, { desc = "Save, compile and run C++ file" })
    end,
}
