-- PSR-12 compliant indentation for PHP
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

-- Optional: Additional PSR-12 settings
vim.opt_local.textwidth = 120
vim.opt_local.fileformat = "unix"

-- Optional: PHP-specific keymaps
local keymap = vim.keymap.set
keymap('n', '<leader>pr', ':! php %<CR>', { buffer = true, desc = 'Run PHP file' })
keymap('n', '<leader>pl', ':!php -l %<CR>', { buffer = true, desc = 'PHP syntax check' })
