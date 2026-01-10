local M = {}

function M.setup()
  local notes = require('digital-notes')
  
  vim.api.nvim_create_user_command(
    'InsertFrontmatter',
    function()
      notes.insert_frontmatter_at_top()
    end,
    { desc = 'Insert YAML frontmatter at top of buffer' }
  )
end

return M
