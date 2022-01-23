call plug#begin('~/.config/nvim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'vimwiki/vimwiki'

    " Colorschemes
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/everforest'
    Plug 'tomasiser/vim-code-dark'
call plug#end()

" Set leader key
let mapleader="\<Space>"

" Run code
autocmd FileType javascript map <buffer> <leader>r :w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType ruby map <buffer> <leader>r :w<CR>:exec '!ruby' shellescape(@%, 1)<CR>
autocmd FileType cpp map <buffer> <leader>r :w<CR>:!g++ % -o comp && ./comp<CR>

" Vimwiki
let wiki_1 = {}
let wiki_1.path = '~/Gombiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_table_mappings = 0

" No indent line in startify and plug
let g:indentLine_fileTypeExclude = ['startify', 'plug']
let g:indentLine_leadingSpaceEnabled = 0

" Sane defaults
colorscheme gruvbox-material
set expandtab
set incsearch
set laststatus=0
set linebreak
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nu
set shiftwidth=4
set signcolumn=yes
set smartcase
set smartindent
set tabstop=4
set termguicolors
set wrap
syntax on

" Autocomplete with TAB
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" CUSTOM KEYMAPS
" Leader buttons
nnoremap <leader>s :Startify<CR>
nnoremap <leader>c :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
nnoremap <leader>i :!wc %<CR>
" Keys to move between tabs
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabNext<CR>
" Reset search highlite when ESC is pressed
map <ESC> :noh<CR>
" Map C-direction for splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Makes so when you have a big line you can press j to go down even if it isn't seperate lines
map j gj
map k gk
" Superscript characters
inoremap <C-n>q ⁰
inoremap <C-n>w ¹
inoremap <C-n>e ²
inoremap <C-n>r ³
inoremap <C-n>t ⁴
inoremap <C-n>y ⁵
inoremap <C-n>u ⁶
inoremap <C-n>i ⁷
inoremap <C-n>o ⁸
inoremap <C-n>p ⁹
inoremap <C-n>a ⁻
" Accented letters
inoremap <C-e> è
inoremap <C-p> é
inoremap <C-o> ò
inoremap <C-u> ù
inoremap <C-a> à
inoremap <C-i> ì
cnoremap <C-e> è
cnoremap <C-p> é
cnoremap <C-o> ò
cnoremap <C-u> ù
cnoremap <C-a> à
cnoremap <C-i> ì
