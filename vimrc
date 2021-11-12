set nocompatible
set backspace=2
set number
set hls
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set cursorline
set encoding=utf8
set background=dark
set scrolloff=5
set exrc
set secure
set mouse=a
filetype plugin on
syntax on
colorscheme evening

" Ctrl+u to change utf8 encoding
" Ctrl+b to change big5 encoding
" set <C-u>=^U
" set <C-b>=^B
" map <C-u> :set fileencoding=utf8
" map <C-b> :set fileencoding=big5

" swap word function
function! SwapWords(dict, ...)
    let words = keys(a:dict) + values(a:dict)
    let words = map(words, 'escape(v:val, "|")')
    if(a:0 == 1)
        let delimiter = a:1
    else
        let delimiter = '/'
    endif
    let pattern = '\v(' . join(words, '|') . ')'
    exe '%s' . delimiter . pattern . delimiter
        \ . '\=' . string(Mirror(a:dict)) . '[S(0)]'
        \ . delimiter . 'g'
endfunction

" color or highlight
hi Pmenu ctermbg=white
hi Pmenu ctermfg=black
hi PmenuSel ctermfg=white ctermbg=blue
hi Normal  ctermfg=252 ctermbg=none
hi Visual term=reverse cterm=reverse guibg=Grey


" netrw
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
" close if final buffer is netrw
augroup finalcountdown
	autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" |q|endif
	nmap - :Lexplore<cr>
augroup END

" Vundle Start
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-abolish'

" YCM
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'


" Vundle End
call vundle#end()
filetype plugin indent on    " required

