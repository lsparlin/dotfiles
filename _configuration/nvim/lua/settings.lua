local set = vim.opt
local g = vim.g

local M = {}
function M.run ()
  vim.cmd [[silent! colorscheme dracula]]
  vim.cmd [[hi Comment cterm=italic gui=italic guifg=gray ctermfg=gray]]
  vim.cmd [[hi NonText guifg=gray ctermfg=gray]]

  set.syntax = "on"
  set.filetype = "on"
  set.filetype.indent = "on" -- Enable filetype-specific indenting
  set.filetype.plugin = "on"
  set.encoding = "utf-8"
  set.hidden = true
  set.number = true
  set.smartindent = true
  set.hlsearch = true
  set.incsearch = true
  set.scrolljump=5
  set.scrolloff=3
  set.sidescroll=2
  set.wildmenu =true
  set.wildmode="list:longest,full"
  set.tabstop = 2
  set.shiftwidth = 2
  set.expandtab = true
  set.foldmethod="syntax"
  vim.api.nvim_create_autocmd({"BufWinEnter"}, {
      pattern = {"?*"},
      command = "silent! :%foldopen!",
    })

  set.wrap = true
  set.linebreak = true
  set.breakindent = true
  set.breakindentopt="sbr"
  set.showbreak="↪> "

  g.vim_markdown_new_list_item_indent = 0
end

return M
