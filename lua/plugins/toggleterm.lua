return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            size = 20,
            open_mapping = [[<C-\>]],
            shade_terminals = true,
            direction = "float",
            start_in_insert = true,
            float_opts = {
                border = "curved",
                width = 80,
                height = 20,
            },
        })

        local Terminal = require("toggleterm.terminal").Terminal

        local cpp_runner = Terminal:new({
            cmd = "",
            hidden = true,
            direction = "float",
            close_on_exit = false,
        })

        function _RUN_CPP()
            vim.cmd("write")
            local file = vim.fn.expand("%")
            local output = vim.fn.expand("%:r")
            local cmd = string.format("g++ -std=c++17 -O2 -Wall -Wextra -Wshadow %s -o %s && ./%s", file, output, output)

            cpp_runner.cmd = cmd
            cpp_runner:toggle()
        end

        local test_runner = Terminal:new({
            cmd = "",
            hidden = true,
            direction = "float",
            close_on_exit = false,
        })

        function _RUN_CPP_WITH_TESTS()
            vim.cmd("write")
            local file = vim.fn.expand("%")
            local output = vim.fn.expand("%:r")
            local dir = vim.fn.expand("%:p:h")
            local cmd = string.format("g++ -std=c++17 -O2 -Wall -Wextra -Wshadow %s -o %s", file, output)

            test_runner.cmd = cmd
            test_runner:toggle()

            vim.defer_fn(function()
                local test_dir = dir .. "/tests"
                local test_files = vim.fn.glob(test_dir .. "/*.in", false, true)
                if #test_files == 0 then
                    vim.notify("No test files found in " .. test_dir, vim.log.levels.WARN)
                    return
                end

                for _, test_file in ipairs(test_files) do
                    local test_name = vim.fn.fnamemodify(test_file, ":t:r")
                    local expected_file = test_dir .. "/" .. test_name .. ".out"
                    local cmd = string.format("./%s < %s > /tmp/_cp_output.txt 2>&1 && diff -q /tmp/_cp_output.txt %s", output, test_file, expected_file)
                    local result = vim.fn.system(cmd)
                    if vim.v.shell_error == 0 then
                        vim.notify("Test " .. test_name .. ": PASSED", vim.log.levels.INFO)
                    else
                        vim.notify("Test " .. test_name .. ": FAILED", vim.log.levels.ERROR)
                    end
                end
            end, 1000)
        end
    end,
}
