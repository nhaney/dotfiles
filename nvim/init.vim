call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" General Settings
set nu
filetype plugin on
let mapleader=","
set timeout timeoutlen=1500

" Shared System Clipboard with WSL compatibility
set clipboard+=unnamedplus

if has ('wsl')
	let g:clipboard = {
		  \   'name': 'win32yank-wsl',
		  \   'copy': {
		  \      '+': 'win32yank.exe -i --crlf',
		  \      '*': 'win32yank.exe -i --crlf',
		  \    },
		  \   'paste': {
		  \      '+': 'win32yank.exe -o --lf',
		  \      '*': 'win32yank.exe -o --lf',
		  \   },
		  \   'cache_enabled': 1,
		  \ }
endif

" Tab settings
" Default to python/rust settings
set tabstop=4 softtabstop=4 expandtab shiftwidth=4

" Language specific tab settings
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType java setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab


" FZF settings - use ripgrep
nnoremap <C-p> :Rg<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

