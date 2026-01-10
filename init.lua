vim.g.mapleader = " "

-- Lazy
require("config.lazy")

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- LSP
-- vim.lsp.enable({ "lua_ls", "tinymist", "markdown_oxide", "java_language_server", "rust_analyzer" })

-- Must-haves
vim.o.relativenumber = true
vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

-- Primary register yanking/deleting
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.cmd[[colorscheme tokyonight-night]]

-- QoL
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- Telescope
vim.keymap.set('n', '<leader>lg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>gs', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>gf', ':Telescope git_files<CR>')
