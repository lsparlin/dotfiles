call plug#begin('~/.vim/plugged')

if executable('ctags')
  Plug 'majutsushi/tagbar'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'vim-scripts/taglist.vim'
endif
Plug 'preservim/nerdtree'
" Plug 'godlygeek/tabular'
Plug 'ourigen/skyline.vim'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'othree/html5.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rails'
Plug 'derekwyatt/vim-scala'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-open-url'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-locfile'}

call plug#end()
