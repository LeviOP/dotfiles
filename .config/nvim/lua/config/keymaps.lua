-- Buffer navigation
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>p", ":bp<CR>")
vim.keymap.set("n", "<leader>d", ":bd<CR>")

-- View diff
vim.keymap.set("n", "<leader>g", ":w !diff % -<CR>")

-- Telescope
local telescope = require("telescope")
local telescopeBuiltins = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescopeBuiltins.find_files, {})
vim.keymap.set("n", "<leader>fg", telescopeBuiltins.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescopeBuiltins.buffers, {})
vim.keymap.set("n", "<leader>fh", telescopeBuiltins.help_tags, {})
vim.keymap.set("n", "<leader>fe", function() telescope.extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = true }) end, {})

-- Some emacs binds in insert mode
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-b>", "<Left>")
