"================================GENERAL================================
set nocompatible
set confirm
set history=1000
set autoread
set backupdir=~/.cache/vim
set dir=~/.cache/vim
set spell


"================================DEVICES================================
set clipboard=unnamedplus
set mouse=a


"================================INSERT================================
set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set backspace=indent,eol,start

filetype indent on


"================================COMMAND================================
set wildmenu
set wildmode=list:longest,full
set wildignore=*.exe,*.jpg,*.gif,*.png,*.pdf,*.swp,.*pyc,*.out,*.bin,*.o


"================================ENVIRONMENT================================
set background=dark
set t_Co=256
syntax on
set showmatch


"================================NUMBER================================
set number
highlight LineNr cterm=bold ctermbg=none ctermfg=DarkGrey


"================================STATUSLINE================================
set laststatus=2

set statusline=
set statusline+=%1*\ %{expand('%:p')}\ 
set statusline+=%#LineNr#
set statusline+=%{FileSize()}
set statusline+=%{IsBinary()}

set statusline+=%=
set statusline+=\ [%{ENCODING()},\ %{&fileformat}]\ 
set statusline+=%1*\ Row:%l/%L\ Col:%c\ (%3p%%)\ 

highlight User1 cterm=none ctermbg=DarkMagenta ctermfg=White

function ENCODING()
    if (&fileencoding)
        return &fileencoding
    else
        return &encoding
    endif
endfunction

function IsBinary()
    if (&binary == 0)
        return ""
    else
        return "[Binary]"
    endif
endfunction

function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . 'B]'
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

"================================CURSORLINE================================
set cursorline
highlight CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White


"================================SEARCH================================
set hlsearch
set incsearch
set smartcase
highlight Search cterm=reverse ctermbg=none ctermfg=none


