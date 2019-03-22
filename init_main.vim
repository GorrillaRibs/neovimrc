" If no GUi
if !exists('g:GtkGuiLoaded')
	call plug#begin('/home/loto/.local/share/nvim/plugged/')
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'flazz/vim-colorschemes', { 'as': 'vim-colorschemes' }
	Plug 'scrooloose/nerdtree', { 'as': 'nerdtree' }
	Plug 'jiangmiao/auto-pairs', { 'as': 'auto-pairs' }
	Plug 'valloric/youcompleteme', { 'as': 'youcompleteme' }
	Plug 'bling/vim-airline', { 'as': 'vim-airline' }
	Plug 'airblade/vim-gitgutter', { 'as': 'vim-gitgutter' }
	Plug 'vim-airline/vim-airline-themes', { 'as': 'vim-airline-themes' }
	Plug 'tpope/vim-fugitive', { 'as': 'fugitive.vim' }
	Plug 'chriskempson/base16-vim', { 'as': 'base16-vim' }
	Plug 'neomake/neomake', { 'as': 'neomake' }
	Plug 'liuchengxu/vim-which-key', { 'as': 'vim-which-key' }
	Plug 'arcticicestudio/nord-vim', { 'as': 'nord-vim' }
	Plug 'lervag/vimtex', { 'as': 'vimtex' }
	Plug 'dylanaraps/wal.vim', { 'as': 'wal.vim' }
	call plug#end()
	"colorscheme dracula
	colorscheme wal
endif
set linebreak
set number
set mouse=a

function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction
let g:airline_powerline_fonts =1 
let g:bufferline_echo = 0
let g:airline#extensions#whitespace#enabled = 0

set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:tex_flavor='latex'
let g:ycm_global_ycm_extra_conf = '/home/loto/.config/nvim/plugged/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'

" If GUI
if exists('g:GtkGuiLoaded')
	autocmd FileType tex setlocal spell spelllang=en
	colorscheme dracula
	let g:airline_theme='dracula'
	set ttimeoutlen=500
	set termguicolors
	let g:GuiInteralClipboard = 1
	call rpcnotify(1, 'Gui', 'Command', 'Transparency', '0.94')
endif

filetype plugin on
filetype indent on
nnoremap <C-b> :w<cr>:Neomake<cr>

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

