call plug#begin('~/.vim/plugged')
 
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-apathy'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-open-url'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-locfile'}
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'

call plug#end()
