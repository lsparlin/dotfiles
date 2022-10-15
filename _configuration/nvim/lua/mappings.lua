local M = {}

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.run()
  vim.g.mapleader = ','

  map('n', '<leader>s', ':set spell!<CR>')
  map('n', '<leader>0', ':set relativenumber!<CR>')

  -- NERDTree
  map('n', '<leader>nt', ':NERDTreeToggle<CR>', { silent = true })
  map('n', '<leader>nf', ':NERDTreeFind<CR>', { silent = true })
  -- Telescope
  map('n', '<leader>tf', ':Telescope find_files<CR>', { silent = true })
  map('n', '<leader>tg', ':Telescope git_files<CR>', { silent = true })
  map('n', '<leader>tb', ':Telescope buffers<CR>', { silent = true })
  map('n', '<leader>th', ':Telescope help_tags<CR>', { silent = true })
  -- COC code navigation.
  map('n', 'gd', '<Plug>(coc-definition)', { noremap = false, silent = true })
  map('n', 'gr','<Plug>(coc-references)', { noremap = false, silent = true })
end

return M
