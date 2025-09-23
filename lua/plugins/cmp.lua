-- lua/plugins/cmp.lua (replace your existing file with this)
return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',

            -- Copilot integration - IMPORTANT: Load copilot first
            {
                'zbirenbaum/copilot.lua',
                cmd = "Copilot",
                event = "InsertEnter",
                config = function()
                    require("copilot").setup({
                        suggestion = { enabled = false }, -- disable built-in suggestion
                        panel = { enabled = false },      -- disable built-in panel
                        filetypes = {
                            yaml = false,
                            markdown = false,
                            help = false,
                            gitcommit = false,
                            gitrebase = false,
                            hgcommit = false,
                            svn = false,
                            cvs = false,
                            ["."] = false,
                            cpp = true,
                            c = true,
                            python = true,
                            javascript = true,
                            ["*"] = true, -- enable for all other filetypes
                        },
                    })
                end,
            },
            {
                'zbirenbaum/copilot-cmp',
                config = function()
                    require("copilot_cmp").setup()
                end,
            },
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            -- IMPORTANT: Wait a bit for copilot to initialize
            vim.defer_fn(function()
                -- Check if copilot_cmp is available
                local ok, copilot_cmp = pcall(require, "copilot_cmp")
                if not ok then
                    vim.notify("copilot_cmp not found!", vim.log.levels.ERROR)
                    return
                end

                -- Check if copilot source is registered
                local sources = require("cmp").get_config().sources
                local copilot_found = false
                for _, source_group in ipairs(sources or {}) do
                    for _, source in ipairs(source_group) do
                        if source.name == "copilot" then
                            copilot_found = true
                            break
                        end
                    end
                end

                if not copilot_found then
                    vim.notify("Copilot source not found in CMP config!", vim.log.levels.WARN)
                end
            end, 1000)

            -- Load vscode-style snippets
            require('luasnip.loaders.from_vscode').lazy_load()

            -- Define a subtle thin border
            local border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

            -- Floating window border style
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5c6370", bg = "NONE" })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered({
                        border = border_chars,
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        border = border_chars,
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                },

                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                }),

                sources = cmp.config.sources({
                    { name = "copilot",  group_index = 2 },
                    { name = "nvim_lsp", group_index = 2 },
                    { name = "luasnip",  group_index = 2 },
                }, {
                    { name = "buffer", group_index = 2 },
                    { name = "path",   group_index = 2 },
                }),

                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = function(entry, vim_item)
                        local source_names = {
                            copilot = '[Copilot]',
                            nvim_lsp = '[LSP]',
                            luasnip = '[Snippet]',
                            buffer = '[Buffer]',
                            path = '[Path]',
                        }
                        vim_item.menu = source_names[entry.source.name] or ''

                        -- Add special highlighting for copilot
                        if entry.source.name == "copilot" then
                            vim_item.kind = ""
                            vim_item.kind_hl_group = "CmpItemKindCopilot"
                        end

                        return vim_item
                    end,
                },

                -- Add copilot-specific sorting
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        -- Try to require copilot comparator, but don't fail if not available
                        function(entry1, entry2)
                            local ok, comparator = pcall(require, "copilot_cmp.comparators")
                            if ok and comparator.prioritize then
                                return comparator.prioritize(entry1, entry2)
                            end
                            return nil
                        end,
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },

                experimental = {
                    ghost_text = false, -- Disabled since we use copilot
                },
            })

            -- Set highlight for Copilot
            vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

            -- `/` cmdline setup
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- `:` cmdline setup
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            -- Debug command
            vim.api.nvim_create_user_command('CopilotDebug', function()
                local copilot_ok = pcall(require, "copilot")
                local copilot_cmp_ok = pcall(require, "copilot_cmp")

                print("Copilot loaded:", copilot_ok)
                print("Copilot CMP loaded:", copilot_cmp_ok)

                -- Check if copilot source is available
                local sources = {}
                for name, source in pairs(require("cmp").core.sources) do
                    table.insert(sources, name)
                end
                print("Available CMP sources:", vim.inspect(sources))
            end, {})
        end,
    }
}
