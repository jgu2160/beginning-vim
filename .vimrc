" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-endwise'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'skalnik/vim-vroom'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required

" Settings
set nocompatible              " be iMproved, required
filetype off                  " required

set noswapfile
set softtabstop=2
set tabstop=2 shiftwidth=2 expandtab
set expandtab " use spaces, not tabs (optional)


" ================ Leader and other mappings =======================
let mapleader = "\<Space>"

"save with leader w
nnoremap <Leader>w :w<CR>
"save and quit with leader q
nnoremap <Leader>q :wq<CR>

"esc with j f, f j quickly
inoremap jf <esc>
inoremap fj <esc>

map <C-i> :NERDTreeToggle<CR>

"easy pasting
map <Leader>p :r !pbpaste<CR>

"shortcuts for Ruby debugging
map <Leader>bb orequire 'byebug'; byebug<esc>:w<cr>
map <Leader>yy orequire 'pry'; binding.pry<esc>:w<cr>


" ================ Delete whitespace function =======================
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    "associate the .es6 file extension with JavaScript
    autocmd BufRead,BufNewFile *.es6 setfiletype javascript

    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() " strip trailing whitespace on save
