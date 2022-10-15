-- bootstrap packer plugin if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local M = {}

function M.run()
  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'preservim/nerdtree'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-rails'
    use 'tpope/vim-liquid'
    use 'tpope/vim-apathy'
    use 'kana/vim-textobj-user'
    use 'nelstrom/vim-textobj-rubyblock'
    use 'tpope/vim-bundler'
    use 'tpope/vim-endwise'
    use 'tpope/vim-capslock'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'dhruvasagar/vim-open-url'
    use 'Mofiqul/dracula.nvim'
    use 'jlanzarotta/bufexplorer'
    use {
      'neoclide/coc.nvim',
      branch = 'release'
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'github/copilot.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end

    require('lualine').setup({
        sections = {
          lualine_b = { 'branch' },
          lualine_x = { 'encoding', 'filetype' },
        },
      })
    require('telescope').setup({
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          git_files = {
            theme = "dropdown",
          }
        },
      })
  end)
end

return M
