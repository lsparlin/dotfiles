local M = {}

-- setup for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local setup_lazy_plugin_manager = function()
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
  end
  vim.opt.rtp:prepend(lazypath)
end

function M.run()
  setup_lazy_plugin_manager()
 
  require("lazy").setup({
    {
      'nvim-lualine/lualine.nvim',
      config = function()
        require('lualine').setup({
            sections = {
              lualine_b = { 'branch' },
              lualine_x = { 'encoding', 'filetype' },
            },
          })
      end
    },
    'preservim/nerdtree',
    'sheerun/vim-polyglot',
    'NoahTheDuke/vim-just', -- justfile support (https://github.com/casey/just)
    'tpope/vim-rails',
    'tpope/vim-liquid',
    'tpope/vim-apathy',
    'tpope/vim-bundler',
    'tpope/vim-endwise',
    'tpope/vim-capslock',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    { -- http protocol support for git-fugitive
      'garyjohnson/vim-fubitive',
      branch = 'allow-http-protocol'
    },
    'tpope/vim-surround',
    'dhruvasagar/vim-open-url', -- open URL and search functionality
    'Mofiqul/dracula.nvim',
    'jlanzarotta/bufexplorer',
    {
      'neoclide/coc.nvim',
      branch = 'release'
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
      config = function()
        require('telescope').setup({
            pickers = {
              find_files = {
                theme = "dropdown",
              },
              git_files = {
                theme = "dropdown",
              },
              live_grep = {
                theme = "dropdown",
              }
            },
          })
      end
    },
    { -- improved code folds
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async',
      config = function()
        require('ufo').setup()
      end
    },
    'github/copilot.vim',
    { -- guide for leader key bindings
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end,
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 400
      end,
    }
  })
end

return M
