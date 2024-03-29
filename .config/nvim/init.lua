local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins", {
    change_detection = {
        notify = false
    }
})
require("config")

-- require("plugins")
-- 
-- vim.cmd([[
--     so ~/.config/nvim/legacy.vim
-- ]])
-- 
-- require("lsp")
-- require("nvimcmp")
-- 
-- require('lualine').setup {
--     sections = {
--         lualine_c = {
--             {
--                 'filename',
--                 file_status = true, -- displays file status (readonly status, modified status)
--                 path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
--             }
--         }
--     }
-- }
-- require('bufferline').setup {
--     options = {
--         separator_style = "slant",
--         color_icons = true,
--         get_element_icon = function(element)
--             local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
--             return icon, hl
--         end,
--         show_buffer_icons = true,
--         show_buffer_close_icons = true,
--         show_buffer_default_icon = true,
--         show_close_icon = true,
--         buffer_close_icon = '',
--         modified_icon = '●',
--         close_icon = '',
--         left_trunc_marker = '',
--         right_trunc_marker = ''
--     }
-- }
-- 
-- local null_ls = require("null-ls")
-- 
-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             -- apply whatever logic you want (in this example, we'll only use null-ls)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr,
--     })
-- end
-- 
-- -- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- 
-- -- add to your shared on_attach callback
-- local on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--                 lsp_formatting(bufnr)
--             end,
--         })
--     end
-- end
-- 
-- null_ls.setup {
--     --[[
--     sources = {
--         null_ls.builtins.diagnostics.eslint_d.with({
--             filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
--         }),
--         null_ls.builtins.code_actions.eslint_d.with({
--             filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
--         }),
--         null_ls.builtins.formatting.eslint_d.with({
--             filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
--         })
--     },
--     on_attach = on_attach
--     --]]
-- }
-- 
-- vim.diagnostic.config({
--     underline = true,
--     signs = true,
--     virtual_text = false,
--     float = {
--         header = "",
--         source = true
--     },
--     update_in_insert = false,
--     severity_sort = false
-- })
-- 
-- require 'nvim-treesitter.configs'.setup {
--     highlight = {
--         enable = true
--     },
--     indent = {
--         enable = true
--     },
--     playground = {
--         enable = true,
--         disable = {},
--         updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--         persist_queries = false, -- Whether the query persists across vim sessions
--         keybindings = {
--             toggle_query_editor = 'o',
--             toggle_hl_groups = 'i',
--             toggle_injected_languages = 't',
--             toggle_anonymous_nodes = 'a',
--             toggle_language_display = 'I',
--             focus_language = 'f',
--             unfocus_language = 'F',
--             update = 'R',
--             goto_node = '<cr>',
--             show_help = '?',
--         },
--     }
-- 
-- }
-- 
-- vim.filetype.add({
--     extension = {
--         res = "vdf"
--     }
-- })
-- 
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.vdf = {
--     install_info = {
--         url = "/Users/3093357/Desktop/code/js/tree-sitter-vdf",
--         files = { "src/parser.c" }
--     }
-- }
-- 
-- vim.opt.foldmethod = "expr"
-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldenable = false
-- vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.opt.foldcolumn = "1"
-- 
-- require 'telescope'.setup {
--     extensions = {
--         ["ui-select"] = {
--             require("telescope.themes").get_cursor {}
--         },
--         file_browser = {
--             hidden = true
--         }
--     }
-- }
-- local telescope = require("telescope")
-- require("telescope").load_extension "file_browser"
-- require("telescope").load_extension "ui-select"
-- local telescopeBuiltins = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', telescopeBuiltins.find_files, {})
-- vim.keymap.set('n', '<leader>fg', telescopeBuiltins.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', telescopeBuiltins.buffers, {})
-- vim.keymap.set('n', '<leader>fh', telescopeBuiltins.help_tags, {})
-- vim.keymap.set('n', '<leader>fe', function() telescope.extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = true }) end, {})
-- vim.keymap.set('n', '<leader>ft', telescope.extensions["todo-comments"]["todo-comments"], {})
-- 
-- require 'colorizer'.setup {
--     filetypes = {
--         "css",
--         "html"
--     },
--     user_default_options = {
--         tailwind = true
--     }
-- }
