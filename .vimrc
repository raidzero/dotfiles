set number
colorscheme grb256
source $VIMRUNTIME/mswin.vim
behave mswin

set laststatus=2
set updatetime=250

set guioptions -=m 
set guioptions -=T
set guioptions -=r
set guifont=Liberation\ Mono\ for\ Powerline\ 10 

let g:gitgutter_sign_column_always = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'

let mapleader = ','

noremap <tab> gt
noremap <c-tab> gT

" comment the current line for various file types
augroup comments
	"autocmd!
	autocmd FileType python,bash,sh nnoremap <leader>c I#<esc>
	autocmd FileType php,c,javascript nnoremap <leader>c I//#<esc>
augroup END

" quickly edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" uppercase/lowercase the current word
nnoremap <leader>U viwU
nnoremap <leader>u viwu
inoremap <leader>U <esc>viwUi
inoremap <leader>u <esc>viwui

" surround current word in single/double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" surround current visual selection in single/double quotes
nnoremap <leader>v" viw<esc>`a"<esc>`>a"<esc>
nnoremap <leader>v' viw<esc>`a'<esc>`>a'<esc>

" move current line down/up
nnoremap <leader>- ddp
nnoremap <leader>_ ddP



