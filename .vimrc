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
let g:airline_theme='simple'
