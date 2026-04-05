local M = {}

local function toggle_spellcheck(lang)
	local spell_on = vim.opt_local.spell:get()
	local current_langs = vim.opt_local.spelllang:get()
	local current_lang = spell_on and current_langs[1] or nil

	if current_lang == lang then
		vim.opt_local.spell = false
		return
	end

	vim.opt_local.spell = true
	vim.opt_local.spelllang = { lang }
end

local function create_usercommands()
	vim.api.nvim_create_user_command("ToggleEnglishSpellcheck", function()
		toggle_spellcheck("en")
	end, { desc = "Toggle English spell checking" })

	vim.api.nvim_create_user_command("ToggleGermanSpellcheck", function()
		toggle_spellcheck("de")
	end, { desc = "Toggle German spell checking" })
end

local function create_keymaps()
	vim.keymap.set("n", "<leader>en", function()
		toggle_spellcheck("en")
	end, { desc = "Toggle English spell checking" })

	vim.keymap.set("n", "<leader>de", function()
		toggle_spellcheck("de")
	end, { desc = "Toggle English spell checking" })
end

function M.setup()
	create_usercommands()
	create_keymaps()
end

return M
