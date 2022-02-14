" Key mappings
 
let mapleader = ","
vnoremap . :norm.<CR>

nnoremap <leader>s :set spell!<CR>

" NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

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
