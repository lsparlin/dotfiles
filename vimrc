set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
  Bundle 'xolox/vim-misc'
  Bundle 'xolox/vim-easytags'
  Bundle 'vim-scripts/taglist.vim'
endif
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'elzr/vim-json'
Bundle "pangloss/vim-javascript"
Bundle 'mxw/vim-jsx'
Bundle 'othree/html5.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-rails'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-capslock'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'derekwyatt/vim-scala'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'dhruvasagar/vim-open-url'
 
" All of your Plugins must be added before the following line
call vundle#end()

set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

autocmd FileType ruby compiler ruby

syntax on
hi Visual ctermbg=White
hi Comment cterm=italic
set nowrap
set number
set smartindent
set hlsearch
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set sidescroll=2                " cols to scroll when cursor leaves screen to the side
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
setlocal foldmethod=syntax      " create fold points automatically based on syntax


" auto-save view (state) - currently for saving fold state
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview
autocmd BufWinEnter ?* silent! :%foldopen!

" status line (not needed with airline plugin)
" set laststatus=2
" hi statusline ctermbg=lightgray
 
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set encoding=utf-8
 
" custom file type mappings
au BufRead,BufNewFile *.dom set filetype=html
 
" Key mappings
let mapleader = ","
nnoremap <silent> <leader>b :TagbarToggle<CR>
nnoremap <leader>s :set spell!<CR>
vnoremap . :norm.<CR>

"vim-arline"
"let g:airline_branch_prefix = ''
"let g:airline_readonly_symbol   = ''
"let g:airline_linecolumn_prefix = ''
let g:airline_enable_branch = 1
"let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts = 1

" let g:airline_theme = 'powerlineish'
let g:airline_theme = 'bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '🌿'

" ctrlp search files through git to ignore git-ignored files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard', 'find %s -maxdepth 2 -type f']

runtime macros/matchit.vim

" Vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
