" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor

if &term =~ '^xterm'
	" Cursor in terminal:
	" Link: https://vim.fandom.com/wiki/Configuring_the_cursor
	" 0 -> blinking block not working in wsl
	" 1 -> blinking block
	" 2 -> solid block
	" 3 -> blinking underscore
	" 4 -> solid underscore
	" Recent versions of xterm (282 or above) also support
	" 5 -> blinking vertical bar
	" 6 -> solid vertical bar

	" normal mode
	let &t_EI .= "\e[1 q" 	
	" insert mode
	let &t_SI .= "\e[5 q"	

	augroup windows_term
		autocmd!
		autocmd VimEnter * silent !echo -ne "\e[1 q" 
		autocmd VimLeave * silent !echo -ne "\e[5 q" 
	augroup END
endif

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" enable highlighting
set hlsearch
" map space to clear highlighting
map <Space> :noh<cr>

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

set showmode
" use the system clipboard for yanking and pasting
set clipboard=unnamed
set clipboard+=ideaput

" remap <Leader>
let mapleader=","

" enter normal mode with jj instead of <Esc>
inoremap jj <Esc>

" remap save
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>gi


" map recursively fold and unfold
nnoremap zC :action CollapseRegionRecursively<CR>
nnoremap zO :action ExpandRegionRecursively<CR>


" remapping ^ and $
nnoremap H ^
nnoremap L $
onoremap H ^
onoremap L $
vnoremap H ^
vnoremap L $


" move to the previous/next tab
nmap <C-J> gTzz
nmap <C-K> gtzz


" remapping panels navigating
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h


" allow for smooth scrolling with J and K
nnoremap J 5jzz
nnoremap K 5kzz
vnoremap J 5jzz
vnoremap K 5kzz


" make moving through search always center the cursor
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz


" merge two lines
nnoremap M J


" for removing hightlights of searching
" nnoremap <Leader><space> :noh<cr>


" plugins
call plug#begin('~/.vim/plugged')


" easymotion plugin
Plug 'https://github.com/easymotion/vim-easymotion'
map s <Plug>(easymotion-s)

" highlightedyank plugin
Plug 'https://github.com/machakann/vim-highlightedyank'

" NERDTree plugin
Plug 'https://github.com/preservim/nerdtree'

" ReplaceWithRegister plugin
Plug 'https://github.com/inkarkat/vim-ReplaceWithRegister'

" surround plugin
Plug 'https://github.com/tpope/vim-surround'

call plug#end()
