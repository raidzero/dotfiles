set number
colorscheme grb256
source $VIMRUNTIME/mswin.vim
behave mswin

set keymodel-=stopsel
set laststatus=2
set updatetime=250
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set showcmd
set hlsearch
set incsearch

syntax enable

set mouse=a

let g:gitgutter_sign_column_always = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='surarken'

let mapleader = ','

noremap <tab> gt
noremap <s-tab> gT

" double space tabs
autocmd FileType c,cpp setl sw=2 sts=2 et
" clear trailing whitespace on files just before saving
autocmd FileType c,cpp,sh autocmd BufWritePre <buffer> %s/\s\+$//e

" comment the current line for various file types
augroup comments
	"autocmd!
	autocmd FileType python,bash,sh nnoremap <leader>c I#<esc>
	autocmd FileType php,c,cpp,javascript nnoremap <leader>c I//<esc>
	autocmd FileType vim nnoremap <leader>c I"<esc>
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

" finally try to break the habit of using arrow keys...
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
