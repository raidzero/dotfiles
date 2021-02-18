set number
colorscheme grb256

set laststatus=2
set updatetime=250
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set autoindent
set showcmd
set hlsearch
set incsearch
set modeline

syntax enable

set mouse=a

highlight SignColumn ctermbg=NONE

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='surarken'
let g:airline#extensions#tabline#show_buffers = 0

let mapleader = ','

noremap <tab> gt
noremap <s-tab> gT

" set terminal title to name of file
set title

" double space tabs
autocmd FileType c,cpp setl sw=2 sts=2 et
" clear trailing whitespace on files just before saving
autocmd FileType c,cpp,sh,python autocmd BufWritePre <buffer> %s/\s\+$//e

" comment the current line for various file types
augroup comments
	autocmd!
    autocmd FIleType html nnoremap <leader>c I<!-- <esc>$a -->
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

augroup modelines
    autocmd!
	autocmd FileType python,bash,sh nnoremap <leader>m I# vim: sw=2 ts=2 sts=2 et :<esc>
	autocmd FileType php,c,cpp,javascript nnoremap <leader>m I// vim: sw=2 ts=2 sts=2 et :<esc>
augroup END
