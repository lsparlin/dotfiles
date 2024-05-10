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
    {
      -- mini.nvim is a minimalistic plugin library
      -- https://github.com/echasnovski/mini.nvim
      'echasnovski/mini.nvim',
      version = false,
      config = function()
        miniclue = require('mini.clue')
        require('mini.starter').setup()
        require('mini.comment').setup() -- code comment keybindings
        require('mini.surround').setup() -- text surround keybindings
        require('mini.clue').setup({ -- mini.clue is like which-key
            triggers = {
              -- Leader triggers
              { mode = 'n', keys = '<Leader>' },
              { mode = 'x', keys = '<Leader>' },
              -- `g` key
              { mode = 'n', keys = 'g' },
              { mode = 'x', keys = 'g' },
              -- Window commands
              { mode = 'n', keys = '<C-w>' },
              -- `z` key
              { mode = 'n', keys = 'z' },
              { mode = 'x', keys = 'z' },
            },
            window = { delay = 500 },
            clues = {
              -- Enhance this by adding descriptions for <Leader> mapping groups
              miniclue.gen_clues.builtin_completion(),
              miniclue.gen_clues.g(),
              miniclue.gen_clues.registers(),
              miniclue.gen_clues.windows(),
              miniclue.gen_clues.z(),
            },
          })
      end

    },
    'preservim/nerdtree',
    'sheerun/vim-polyglot',
    'NoahTheDuke/vim-just', -- justfile support (https://github.com/casey/just)
    'tpope/vim-rails',
    'tpope/vim-apathy',
    'tpope/vim-bundler',
    'tpope/vim-endwise',
    'tpope/vim-capslock',
    'tpope/vim-fugitive',
    { -- http protocol support for git-fugitive
      'garyjohnson/vim-fubitive',
      branch = 'allow-http-protocol'
    },
    -- 'tpope/vim-surround',
    'dhruvasagar/vim-open-url', -- open URL and search functionality
    'Mofiqul/dracula.nvim',
    'jlanzarotta/bufexplorer',
    { -- Better lsp management than COC
      'williamboman/mason.nvim',
      dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            border = "rounded"
          }
        )
        require('lspconfig.ui.windows').default_options = {
          border = "rounded",
        }

        require("mason-lspconfig").setup_handlers {
          -- The first entry (without a key) will be the default handler
          -- and will be called for each installed server that doesn't have
          -- a dedicated handler.
          function (server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {}
          end,
        }
      end
    },
    { -- lsp added fanciness
      'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end
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
    { -- completion with lsp awareness
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- source for nvim lsp
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths in commands
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for lua autocompletion
        "onsails/lspkind.nvim", -- vs-code like pictograms
        "mfussenegger/nvim-lint", -- linting
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        cmp.setup({
          completion = {
            completeopt = "menu,menuone,preview,noselect",
          },
          snippet = { -- configure how nvim-cmp interacts with snippet engine
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
          }),
          -- sources for autocompletion
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file system paths
          }),
          -- configure lspkind for vs-code like pictograms in completion menu
          formatting = {
            format = lspkind.cmp_format({
              maxwidth = 50,
              ellipsis_char = "...",
            }),
          },
        })
      end,
    },
    { -- improved code folds
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async',
      config = function()
        require('ufo').setup()
      end
    },
    'github/copilot.vim',
  })
end

return M
