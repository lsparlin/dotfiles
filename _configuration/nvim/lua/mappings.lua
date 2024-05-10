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

  map('n', '<leader>s', ':set spell!<CR>', { desc = "Toggle spell check"})
  map('n', '<leader>0', ':set relativenumber!<CR>', { desc = "Toggle relative line numbers"})

  -- NERDTree
  map('n', '<leader>nt', ':NERDTreeToggle<CR>', { silent = true, desc = "Toggle NERDTree"})
  map('n', '<leader>nf', ':NERDTreeFind<CR>', { silent = true , desc = "Find current file in NERDTree" })
  -- Telescope
  map('n', '<leader>tf', ':Telescope find_files<CR>', { silent = true, desc = "Telescope files"})
  map('n', '<leader>tg', ':Telescope git_files<CR>', { silent = true, desc = "Telescope git files"})
  map('n', '<leader>th', ':Telescope help_tags<CR>', { silent = true, desc = "Telescope tags"})
  map('n', '<leader>tr', ':Telescope live_grep<CR>', { desc = "Telescope grep"})
  map('n', '<leader>tbuf', ':Telescope buffers<CR>', { silent = true, desc = "Telescope buffers"})
  map('n', '<leader>treg', ':Telescope registers<CR>', { silent = true, desc = "Telescope registers"})
  -- code navigation.
  --  add keybinding for lspsaga diagnostics
  map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
  map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', { silent = true, desc = "Show line diagnostics"})
  map('n', 'gd', ':Lspsaga goto_definition<CR>', { silent = true, desc = "Go to definition"})
  map('n', 'gr',':Lspsaga finder<CR>', { silent = true, desc = "Show references"})
  -- java development
  map('n', '<leader>jvb', ':! ./gradlew build<CR>', { silent = true })
  map('n', '<leader>jvt', ':! ./gradlew test<CR>', { silent = true })
end

return M
