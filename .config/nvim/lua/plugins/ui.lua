---@type LazySpec
return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true
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
