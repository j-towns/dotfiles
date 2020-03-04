set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'lervag/vimtex'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

filetype indent plugin on
set expandtab

syntax on
set backspace=indent,eol,start
set ruler
set laststatus=2
set confirm
set ttymouse=xterm2
set mouse=a
set hlsearch
set showcmd
set wildmenu
set incsearch
set autoread
set number
set smartcase

packadd! matchit

set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#vimtex#enabled = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif
let g:airline_symbols.dirty = '!'  " Default symbol with my font is buggy

nnoremap <Leader>w <C-w>

set colorcolumn=80

let g:ycm_python_binary_path = 'python'

iabbrev pdb import pdb; pdb.set_trace()
iabbrev ipdb from IPython.terminal.debugger import set_trace; set_trace()

" Use YCM tab completion in command-line window
autocmd CmdwinEnter * inoremap <expr><buffer> <TAB>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

" According to the vimtex docs this is required to enable ycm completions in
" tex/latex
let g:tex_flavor='latex'
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Easily flick between tabs
nnoremap <Leader>r <C-L>
nnoremap <C-L> gt
nnoremap <C-h> gT
