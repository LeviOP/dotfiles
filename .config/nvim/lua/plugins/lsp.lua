---@type LazySpec
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/lazydev.nvim", config = true }
        },
        opts = {
            servers = {
                -- ts_ls = {},
                vtsls = {},
                svelte = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace"
                            }
                        }
                    }
                },
                jsonls = {
                    capabilities = capabilities,
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true }
                        }
                    }
                },
                html = {
                    capabilities = capabilities
                },
                cssls = {
                    capabilities = capabilities
                },
                vimls = {},
                gopls = {},
                rust_analyzer = {
                    settings = {
                        procMacro = {
                            enable = true
                        }
                    }
                },
                eslint = {
                    on_attach = function(_, bufnr)
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            command = "EslintFixAll",
                        })
                    end
                },
                clangd = {
                    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
                },
                bufls = {}
            },
            setup = {}
        },
        config = function (_, opts)
            local lspconfig = require("lspconfig")

            for server, server_opts in pairs(opts.servers) do
                if opts.setup[server] then
                    opts.setup[server](server, server_opts)
                else
                    lspconfig[server].setup(server_opts)
                end
            end
        end
    }
}
