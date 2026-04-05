local M = {}

---@return nil
function M.setup()
  local notes = require('digital-notes')

  vim.keymap.set('n', '<leader>if', function()
    notes.insert_frontmatter_at_top()
  end, { desc = 'Insert frontmatter' })
end

return M

