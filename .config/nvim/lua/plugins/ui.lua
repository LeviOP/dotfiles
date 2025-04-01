---@type LazySpec
return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        -- temp fix for some transparent background stuff :P
        config = true
        -- opts = {
        --     highlights = {
        --         buffer_selected = {
        --             bg = "#16161e"
        --         },
        --         buffer_visible = {
        --             bg = "#121212"
        --         },
        --         background = {
        --             bg = "#121212"
        --         }
        --     }
        -- }
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            sections = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    }
                }
            }
        }
    },
    "nvim-tree/nvim-web-devicons"
}
