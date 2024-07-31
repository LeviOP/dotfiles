---@type LazySpec
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/neodev.nvim", config = true }
        },
        opts = {
            servers = {
                tsserver = {},
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
                jsonls = {},
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
            setup = {
                jsonls = function()
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true

                    require("lspconfig").jsonls.setup({
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = require("schemastore").json.schemas(),
                                validate = { enable = true }
                            }
                        }
                    })
                end
            }
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
