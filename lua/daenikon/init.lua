local M = {}

function M.init()
	-- require("daenikon.formatter").setup()
	require("daenikon.lsp").setup()
	require("daenikon.treesitter").setup()
	require("daenikon.keybinds").setup()
	require("daenikon.markdown").setup()
	require("daenikon.spellcheck").setup()

	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			-- for markdown
			definition = { pattern = "%f[%w]()Definition()%f[%W]", group = "CustomHipatternsDefinition" },
			yaml_frontmatter = {
				pattern = "^---\n.-\n---",
				group = "CustomHipatternsYamlFrontmatter",
			},

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
	-- nmap <leader>t <Plug>PlenaryTestFile
end

return M
