"General settings --- {{{
color torte
syntax on
set nu
set smartindent 
set sw=4
set softtabstop=4
set expandtab
set hlsearch
set splitright
set nocompatible
set incsearch
set laststatus=2
set statusline=
set statusline+=%n\  
set statusline+=%.40F\ %y\ %m%=
set statusline+=%4l/%4L\   
set statusline+=0x%03B\  
set cursorline
filetype off
filetype plugin indent on   
set completeopt=menu
set backspace=indent,eol,start
" }}}

"Some autocmds --- {{{
augroup filetype_c 
    autocmd!
    autocmd FileType c,cpp setlocal foldmethod=manual
    autocmd FileType c,cpp noremap <buffer> <leader>c I//<esc>
    autocmd FileType c,cpp noremap <buffer> <leader>d ^xx
    "autocmd InsertLeave * if pumvisible()==0|pclose|endif
augroup END
augroup filetype_script 
    autocmd!
    autocmd BufWritePre *.py :normal gg=G
    autocmd FileType tcl,sh,py noremap <buffer> <leader>c I#<esc>
    autocmd FileType tcl,sh,py noremap <buffer> <leader>d ^x<esc>
augroup END
augroup filetype_xml
    autocmd!
    autocmd BufWritePre *.html :normal gg=G
    autocmd FileType xml,html noremap <buffer> <leader>c I<!--><esc>A<--><esc>
    autocmd FileType xml,html noremap <buffer> <leader>d ^5x$3h4x
augroup END
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType .vim noremap <buffer> <leader>c I"<esc>
    autocmd FileType .vim noremap <buffer> <leader>d ^x<esc>
augroup END
augroup filetype_make
    autocmd!
    autocmd FileType make set noet
    autocmd FileType make set sts=4
    autocmd FileType make set ts=4
augroup END
" }}}

"Some maps --- {{{
let mapleader=","
nnoremap tb :TagbarToggle<cr>
nnoremap <F12> : AV<cr>
nnoremap <leader>bf :buffers<cr>
nnoremap <silent> <F3> :Grep<CR>
"nnoremap <leader>F :/\v(^|:{2})start<cr>
"nnoremap <leader>F :/\v(^|:{2})Start<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>g :silent exe "grep! -r " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 5<cr>
nnoremap <leader>pbr :execute "rightbelow vsplit " . bufname("#")<cr>
nnoremap <leader>pbl :execute "leftabove vsplit " . bufname("#")<cr>
nnoremap <leader>pba :execute "aboveleft split " . bufname("#")<cr>
nnoremap <leader>pbb :execute "belowright split " . bufname("#")<cr>
nnoremap <leader>bt :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr><cr>
nnoremap <leader>ast :set tags+=/ws/phye/stl/tags<cr>

inoremap jk <ESC>
inoremap <ESC> <nop>
vnoremap jk <ESC>
onoremap in( :<c-u>normal! f(vi(<cr>
" }}}

"Some Abbreviations --- {{{
abbrev adn and
abbrev teh the
abbrev #### ###########################################################
abbrev ---- -----------------------------------------------------------
abbrev ==== ===========================================================
abbrev //// ///////////////////////////////////////////////////////////
abbrev #i #include
abbrev #d #define
" }}}

" Misc --- {{{
"To get alt key work
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
" }}}

"Plugin specific --- {{{

"pathogen related
call pathogen#infect()
"vundle related, vundle itself is not platform related ..
"set rtp+=~/.vim/bundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'

"For command-t
nnoremap ,t :CommandT<CR>
let g:CommandTMaxFiles=20000

"For SuperTab
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"For NERD
let g:NERDTreeDirArrows=0

"For OmniCppComplete
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_SelectFirstItem=2
let OmniCpp_NamespaceSearch=2
let OmniCpp_ShowPrototypeInAbbr=1

"window manager related
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nnoremap wm :WMToggle<cr>

"cscope related
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cspc=5
" }}}

" Cross platform support --- {{{
"let arch = substitute(system('uname -m'), '\n','','')
"if arch ==? "x86_64"
"    echo "Using x86_64 settings, YCM will be loaded"
"    "YCM related
"    "Bundle 'Valloric/YouCompleteMe'
"    "nmap jd :YcmCompleter GoToDefinitionElseDeclaration<cr>
"    "nmap <leader>jd :YcmCompleter GoToDefinition<cr>
"    "let g:ycm_collect_identifiers_from_tag_files=1
"    "let g:ycm_autoclose_preview_window_after_completion=1
"    "let g:ycm_autoclose_preview_window_after_insertation=1
"    "let g:ycm_confirm_extra_conf =0
"else"
"    echo "Using i686 settings, YCM will not be loaded"
"endif
"" }}}

