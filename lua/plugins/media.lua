-- lua/plugins/media.lua
return {
    "dharmx/telescope-media.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").setup({
            extensions = {
                media = {
                    -- choose backend: "ueberzug", "viu", "chafa", "catimg", "kitty"
                    backend = "ueberzug",

                    backend_options = {
                        ueberzug = {
                            preserve_aspect_ratio = true,
                            -- scale = 0.5,
                        },
                    },

                    -- filetypes/extensions to preview
                    filetypes = { "png", "jpg", "jpeg", "gif", "webp" },

                    -- finder command
                    find_cmd = "rg",
                },
            },
        })

        -- load the telescope extension
        require("telescope").load_extension("media")

        -- keymap
        vim.keymap.set("n", "<leader>fm", function()
            require("telescope").extensions.media.media()
        end, { desc = "Preview images" })
    end,
}
