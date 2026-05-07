return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap-python",
    },
    opts = {
        name = "venv",
        path = ".venv",
        require_activated_venv = false,
        settings = {
            options = {
                notify_user_on_venv_activation = true,
                same_kind = true,
            },
        },
    },
    cmd = "VenvSelect",
}
