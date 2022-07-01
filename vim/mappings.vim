" Key mappings
 
let mapleader = ","
vnoremap . :norm.<CR>

nnoremap <leader>s :set spell!<CR>

nmap <leader>0 :set relativenumber!<CR>

" NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

" Telescope
nnoremap <silent> <leader>tf <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>tg <cmd>Telescope git_files<cr>
nnoremap <silent> <leader>tb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>th <cmd>Telescope help_tags<cr>

" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>rb :Buffers<CR>

" ALE
nnoremap <silent> <leader>at :ALEToggle<CR>
nnoremap <silent> <leader>ad :ALEDetail<CR>
nnoremap <silent> <leader>af :ALEFix<CR>

" COC
nnoremap <silent> <leader>co :CocList outline<CR>

" COC code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
