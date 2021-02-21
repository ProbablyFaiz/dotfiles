syntax on

call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'valloric/youcompleteme'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

let g:material_theme_style = 'darker-community'
colorscheme material
let g:airline#extensions#tabline#enabled = 1

nmap <F1> :NERDTreeToggle<CR>
