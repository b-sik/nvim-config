set encoding=UTF-8
set rtp+=/usr/local/opt/fzf
set nocompatible
set statusline+=%{NearestMethodOrFunction()}
set number
set relativenumber
syntax on
filetype plugin on

call plug#begin()
Plug 'rebelot/kanagawa.nvim'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'liuchengxu/vista.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'airblade/vim-rooter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'valloric/MatchTagAlways'
call plug#end()

so /Users/briansiklinski/.config/nvim/plugins/lightline.vim
so /Users/briansiklinski/.config/nvim/plugins/ale.vim
so /Users/briansiklinski/.config/nvim/plugins/vista.vim
so /Users/briansiklinski/.config/nvim/mappings.vim

lua require('init')
