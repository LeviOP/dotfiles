---@type LazySpec
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            return {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_cursor()
                    },
                    file_browser = {
                        hidden = true
                    }
                }
            }
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        init = function ()
            require("telescope").load_extension("file_browser")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        init = function ()
            require("telescope").load_extension("ui-select")
        end
    }
}
