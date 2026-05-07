vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

for i = 1, 10 do
    vim.api.nvim_set_keymap(
        "n",
        "<leader>t" .. i,
        "<cmd>ToggleTerm " .. i .. "<CR>",
        { noremap = true, silent = true }
    )
end

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>r", "<cmd>lua _RUN_CPP()<CR>", { desc = "Run C++ file" })

vim.keymap.set("n", "<leader>fm", function()
    require("telescope").extensions.media_files.media_files()
end, { desc = "Media files" })

vim.keymap.set("n", "<leader>td", "<cmd>VenvSelect<CR>", { desc = "Select venv" })

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble diagnostics" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Trouble buffer diagnostics" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle<CR>", { desc = "Trouble symbols" })

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

vim.keymap.set("n", "<leader>nt", function() require("neotest").run.run() end, { desc = "Neotest run" })
vim.keymap.set("n", "<leader>nT", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "Neotest debug" })
vim.keymap.set("n", "<leader>ns", function() require("neotest").run.stop() end, { desc = "Neotest stop" })
vim.keymap.set("n", "<leader>no", function() require("neotest").output.open({ enter = true }) end, { desc = "Neotest output" })

vim.keymap.set("n", "<leader>fo", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
vim.keymap.set("n", "<leader>fc", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })

vim.keymap.set("n", "<leader>z", function()
    vim.cmd("Neotest summary")
end, { desc = "Neotest summary" })
