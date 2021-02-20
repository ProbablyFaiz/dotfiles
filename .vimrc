syntax on

call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

if (has('termguicolors'))
  set termguicolors
endif

let g:material_theme_style = 'darker-community'
colorscheme material
