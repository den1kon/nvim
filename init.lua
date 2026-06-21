vim.g.mapleader = " "

-- Lazy
require("config.lazy")

vim.cmd([[colorscheme tokyonight-night]])

-- vim.treesitter.language.add('markdown', { path = "/Users/denyskondratiuk/.config/nvim/parser/markdown.so" })
-- vim.treesitter.language.add('markdown_', { path = "/Users/denyskondratiuk/.config/nvim/parser/markdown_inline.so" })


-- me
require("daenikon").init()
-- My note-taking plugin
-- require("digital-notes.usercommands").setup()
-- require("digital-notes.keybinds").setup()

-- Sync clipboard between the OS and Neovim.
vim.o.clipboard = 'unnamedplus'

vim.o.list = true
vim.opt.listchars = { lead = "·", leadmultispace = "· ", tab = "» ", trail = "·", nbsp = "␣" }

-- Must-haves
--
vim.o.conceallevel = 2
-- Line numbers
vim.o.relativenumber = true
vim.o.number = true

vim.o.wrap = false
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

vim.api.nvim_set_hl(0, "CustomHipatternsDefinition", { bg = "#3f62a8" })
vim.api.nvim_set_hl(0, "CustomHipatternsYamlFrontmatter", { bg = "#2f302e" })
vim.api.nvim_set_hl(0, "SpellBad", { italic = true, undercurl = true })
-- vim.api.nvim_set_hl(0, "SpellCad", { italic = true, fg = "#aaaa27", undercurl = true })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "markdown" },
-- 	callback = function()
-- 		-- markdown_callback()
-- 		-- vim.cmd([[ToggleEnglishSpellcheck]]) -- Enables English spell checking, since it is off by default
-- 	end,
-- })

--- --------------------------------------------

-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float)
