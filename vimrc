set nocompatible              " be iMproved, required
filetype off

" Plugins "

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

so ~/.vim/plugins.vim

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme spaceduck

set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

autocmd FileType ruby compiler ruby

syntax enable
hi Visual ctermbg=White
hi Comment cterm=italic gui=italic
set hidden 
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
set foldmethod=syntax      " create fold points automatically based on syntax

autocmd BufWinEnter ?* silent! :%foldopen!

" pretty wrap?
set wrap
set linebreak
set breakindent
set breakindentopt=sbr
set showbreak=↪>\

" status line (not needed with airline plugin)
" set laststatus=2
" hi statusline ctermbg=yellow
 
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set encoding=utf-8
 
" custom file type mappings
au BufRead,BufNewFile *.dom set filetype=html
 
" Key mappings
let mapleader = ","
nnoremap <silent> <leader>b :CocList outline<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :ALEToggle<CR>
nnoremap <leader>s :set spell!<CR>
vnoremap . :norm.<CR>

"ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'ruby': ['rubocop'],
\  'javascript': ['prettier', 'eslint'],
\}

let g:skyline_gitbranch = 1
let g:vista#renderer#enable_icon = 0

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" vim-markdown do not auto-indent when typing lists
let g:vim_markdown_new_list_item_indent = 0

let g:lightline = {
  \     'colorscheme': 'spaceduck',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     },
  \     'component_function': {
  \       'gitbranch': 'FugitiveHead'
  \     }
  \ }

runtime macros/matchit.vim
