" define an array thing for the palette
let g:airline#themes#surarken#palette = {}

let gui_bae_blue        = "#00afff"
let gui_bg              = "#1c1c1c"
let gui_blurple         = "#5f5fff"
let gui_cyan            = "#00ffff"
let gui_bleu1           = "#00005f"
let gui_bleu2           = "#005fd7"
let gui_gray1           = "#262626"
let gui_gray2           = "#303030"
let gui_gray3           = "#444444"
let gui_gray4           = "#8a8a8a"
let gui_gray5           = "#b2b2b2"
let gui_near_dark       = "#080808"
let gui_pinkeon         = "#ff00ff"
let gui_purple          = "#5f00af"
let gui_sxbg            = "#005f87"
let gui_sxfg            = "#00d7ff"
let gui_scbg            = "#005f87"
let gui_scfg            = "#00d7ff"
let gui_pinkish         = "#af5fff"
let gui_white1          = "#eeeeee"
let gui_white2          = "#ffffff"


let bae_blue            = 39
let bg                  = 234
let blurple             = 63
let cyan                = 51
let bleu1               = 17
let bleu2               = 26
let gray1               = 235
let gray2               = 236
let gray3               = 238
let gray4               = 245
let gray5               = 249
let near_dark           = 232
let pinkeon             = 201
let purple              = 55
let sxbg                = 24      " section X background
let sxfg                = 45      " section X foreground
let scbg                = sxbg    " section C background
let scfg                = sxfg    " section C foreground
let pinkish             = 135
let white1              = 255
let white2              = 231

"""""""""""""""""""""""""""""""
" Colour mapping and variables

" define and create NORMAL mode colours
let s:N1  =  [ gui_bleu1, gui_bae_blue , bleu1     , bae_blue , 'NONE' ]
let s:N2  =  [ gui_cyan , gui_bleu2    , cyan      , bleu2    , 'NONE' ]
let s:N3  =  [ gui_scfg , gui_scbg     , scfg      , scbg     , 'NONE' ]

let g:airline#themes#surarken#palette.normal = 
    \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)


" define and create INSERT mode colours
let s:I1  =  [ gui_white2   , gui_pinkeon, white2    , pinkeon  , 'NONE' ]
let s:I2  =  [ gui_cyan     , gui_purple , cyan      , purple   , 'NONE' ]
let s:I3  =  [ gui_near_dark, gui_blurple, near_dark , blurple  , 'NONE' ]

let g:airline#themes#surarken#palette.insert = 
    \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)


" define and create VISUAL[LINE|BLOCK] colours
let s:V1  =  [ gui_white2   , gui_pinkeon, white2    , pinkeon  , 'NONE' ]
let s:V2  =  [ gui_cyan     , gui_purple , cyan      , purple   , 'NONE' ]
let s:V3  =  [ gui_near_dark, gui_blurple, near_dark , blurple  , 'NONE' ]

let g:airline#themes#surarken#palette.visual =
    \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)


" define and create INACTIVE mode colours
let s:IA1  =  [ gui_gray4, gui_bg   , gray4, bg   , 'NONE' ]
let s:IA2  =  [ gui_gray4, gui_gray1, gray4, gray1, 'NONE' ]
let s:IA3  =  [ gui_gray4, gui_gray2, gray4, gray2, 'NONE' ]

let g:airline#themes#surarken#palette.inactive =
    \ airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)



""""""""""""""""""""""""
" Normal settings


" to work around Section X from defaulting to bold
let g:airline#themes#surarken#palette.normal.airline_x =
    \ [ gui_sxfg, gui_sxbg, sxfg, sxbg, 'NONE' ]


" what should happen when the buffer is modified during normal mode?
let g:airline#themes#surarken#palette.normal_modified =
    \ { 
    \   'airline_x': [ gui_white1, gui_pinkeon, white1, pinkeon, 'bold' ],
    \   'airline_c': [ gui_white1, gui_pinkeon, white1, pinkeon, 'bold' ] 
    \ }



""""""""""""""""""""""""
" Insert settings

" what should happen when the buffer is modified during insert mode?
let g:airline#themes#surarken#palette.insert_modified =
    \ {
    \   'airline_x': [ gui_white1, gui_pinkeon, white1, pinkeon, 'bold' ],
    \   'airline_c': [ gui_white1, gui_pinkeon, white1, pinkeon, 'bold' ]
    \ }

let g:airline#themes#surarken#palette.insert_paste =
    \ { 'airline_a': [ gui_white2, gui_pinkish, white2, pinkish, '' ] }



""""""""""""""""""""""""
" Replace settings

" copy colours from INSERT mode to use for REPLACE
let g:airline#themes#surarken#palette.replace = 
    \ copy(g:airline#themes#surarken#palette.insert)

" change Section A colour
let g:airline#themes#surarken#palette.replace.airline_a = 
    \ [ gui_cyan, gui_bae_blue, bleu1, bae_blue, '' ]


" what should happen when the buffer is modified during replace mode?
let g:airline#themes#surarken#palette.replace_modified = 
    \ g:airline#themes#surarken#palette.insert_modified



""""""""""""""""""""""""
" Visual settings

" what should happen when the buffer is modified during a visual mode?
let g:airline#themes#surarken#palette.visual_modified =
    \ { 
    \   'airline_x': [ gui_white1, gui_pinkeon, white1, pinkeon, 'bold' ],
    \   'airline_c': [ gui_gray2 , gui_pinkeon, gray2 , pinkeon, 'bold' ]
    \ } 



""""""""""""""""""""""""
" Inactive settings

" to work around it defaulting to bold O_o...?
let g:airline#themes#surarken#palette.inactive.airline_c = 
    \ [ gui_gray5 , gui_gray3, gray5, gray3, 'NONE' ]
let g:airline#themes#surarken#palette.inactive.airline_x =
    \ [ gui_gray5 , gui_gray3, gray5, gray3, 'NONE' ]
let g:airline#themes#surarken#palette.inactive.airline_y =
    \ [ gui_gray5 , gui_gray2, gray5, gray2, 'NONE' ]
let g:airline#themes#surarken#palette.inactive.airline_z =
    \ [ gui_gray5 , gui_bg, gray5, bg, 'NONE'  ]

" what should happen when the buffer is modified during inactive mode?
let g:airline#themes#surarken#palette.inactive_modified =
    \ { 
    \   'airline_c' : [ gui_white2 , '', white2, '', 'bold' ],
    \   'airline_x' : [ gui_white2 , '', white2, '', 'bold' ],
    \   'airline_y' : [ gui_white2 , '', white2, '', 'bold' ],
    \   'airline_z' : [ gui_white2 , '', white2, '', 'bold' ]
    \ }



""""""""""""""""""""""""
" Warning colours

let warning_colour = [ gui_near_dark, gui_blurple, near_dark, blurple , '' ]

let g:airline#themes#surarken#palette.normal.airline_warning =
    \ warning_colour
let g:airline#themes#surarken#palette.normal_modified.airline_warning =
    \ warning_colour

let g:airline#themes#surarken#palette.insert.airline_warning =
    \ warning_colour
let g:airline#themes#surarken#palette.insert_modified.airline_warning =
    \ warning_colour

let g:airline#themes#surarken#palette.visual.airline_warning =
    \ warning_colour
let g:airline#themes#surarken#palette.visual_modified.airline_warning =
    \ warning_colour

let g:airline#themes#surarken#palette.replace.airline_warning =
    \ warning_colour
let g:airline#themes#surarken#palette.replace_modified.airline_warning =
    \ warning_colour



""""""""""""""""""""""""
" Airline tab settings


" airline_tab     - unfocused tab
" airline_tabsel  - focused tab
" airline_tabtype - that pink shit in the corner
" airline_tabfill - the unused filler portion
" airline_tabmod  - modified buffer
let g:airline#themes#surarken#palette.tabline =
    \ {
    \   'airline_tab'     : [ gui_cyan     , gui_gray2  ,  cyan     , gray2  , ''     ],
    \   'airline_tabsel'  : [ gui_near_dark, gui_blurple,  near_dark, blurple, ''     ],
    \   'airline_tabtype' : [ gui_near_dark, gui_blurple,  near_dark, blurple, 'bold' ],
    \   'airline_tabfill' : [ gui_white1   , gui_gray2  ,  white1   , gray2  , ''     ],
    \   'airline_tabmod'  : [ gui_white2   , gui_pinkeon,  white2   , pinkeon, 'bold' ]
    \ }

" !! in order for this to work with any other name,
" one would need to change the readonly portion in init.vim to say cyan
" rather than red.
let g:airline#themes#surarken#palette.accents =
    \ {
    \   'red' : [ gui_cyan, '', cyan, '' ]
    \ }
