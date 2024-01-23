---@type LazySpec
return {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    { "petertriho/cmp-git", config = true },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "onsails/lspkind.nvim" },
        ---@return cmp.ConfigSchema
        opts = function()
            local cmp = require("cmp")
            ---@type cmp.ConfigSchema
            return {
                snippet = {
                    expand = function (args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "nvim_lsp_signature_help" }
                }, {
                    { name = "buffer" }
                }),
                ---@diagnostic disable-next-line: missing-fields
                formatting = {
                    format = require("lspkind").cmp_format()
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<S-CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-CR>"] = function(fallback)
                        cmp.abort()
                        fallback()
                    end,
                })
            }
        end,
        init = function ()
            local cmp = require("cmp")

            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = "buffer" },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }
                }, {
                    { name = "cmdline" }
                })
            })
        end
    }
}
