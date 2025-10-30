set nocompatible
filetype off

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'lervag/vimtex'
if !has('nvim')
  Plug 'ycm-core/YouCompleteMe'
endif
Plug 'tpope/vim-surround'
Plug 'dag/vim-fish'
if !has('nvim')
  Plug 'edwinb/idris2-vim'
endif
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'ShinKage/idris2-nvim'
  Plug 'MunifTanjim/nui.nvim'
endif
call plug#end()

filetype plugin indent on

set textwidth=79
set expandtab

syntax on
set backspace=indent,eol,start
set ruler
set laststatus=2
set confirm
if !has('nvim')
  set ttymouse=sgr
endif
set mouse=a
set hlsearch
set showcmd
set wildmenu
set incsearch
set autoread
set number
set ignorecase
set smartcase
set visualbell
set cmdheight=2
set ttimeout ttimeoutlen=10  " Reduce delay on esc key
set sw=2
set termguicolors
set formatoptions+=j
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Recommended settings for Kitty terminal
" Mouse support
if !has('nvim')
  set balloonevalterm
endif
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Yank to EOL instead of whole line
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

packadd! matchit

autocmd vimenter * ++nested colorscheme retrobox
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_medium'

nnoremap <Leader>w <C-w>

set colorcolumn=80

iabbrev pdb import pdb; pdb.set_trace()
iabbrev ipdb from IPython.terminal.debugger import set_trace; set_trace()
iabbrev ijnp import jax.numpy as jnp
iabbrev inp import numpy as np

" Enable YCM symbol search
nmap <leader>yfs <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>gt :YcmCompleter GoTo<CR>
nmap <leader>gd :YcmCompleter GetDoc<CR>
" nmap <leader>ygd <Plug>(YCMFindSymbolInWorkspace)

let g:tex_flavor='latex'

" According to the vimtex docs this is required to enable ycm completions in
" tex/latex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

let g:vimtex_view_method = 'skim'

" Easily flick between tabs
nnoremap <C-n> gt
nnoremap <C-p> gT

" Some things (such as plugin updating) can fail within a fish session without
" this flag
set shell=bash

" Use the system clipboard as the default register
set clipboard=unnamed

set encoding=utf-8
