set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles
    " Libs
        Bundle 'gmarik/vundle'
        Bundle 'L9'
        Bundle 'spacehi.vim'
    " Interface
        " On ubuntu do not forget to run sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
        Bundle 'mileszs/ack.vim'
        Bundle 'ervandew/supertab'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'vim-scripts/vimwiki'
        Bundle 'slack/vim-fuzzyfinder'
        Bundle 'vim-scripts/taglist.vim'
        Bundle 'scrooloose/nerdtree'
    " HTML
        Bundle 'othree/html5.vim'
        Bundle 'hokaccha/vim-html5validator'
        Bundle 'gregsexton/MatchTag'
    " JavaScript
        Bundle 'pangloss/vim-javascript'
        Bundle 'itspriddle/vim-jquery'
        Bundle 'kchmck/vim-coffee-script'
    " JSON
        Bundle 'leshill/vim-json'
    " Python/Django
        Bundle 'fs111/pydoc.vim'
        Bundle 'kevinw/pyflakes-vim'
        Bundle 'nvie/vim-pep8'

filetype plugin indent on     " required!

" Settings
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set autoindent
    set smartindent
    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start

    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    set cursorline
    set showtabline=1
    set wrap
    set encoding=utf-8
    set fileencodings=utf8,cp1251
    set wildmenu
    set title
    set showcmd
    set list

    if version >= 703
        set colorcolumn=140
    end

    set t_Co=256
    set splitbelow
    set splitright

    syntax on

" Russian langmap
    set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>,Ё\~

" Status line
    function! FileSize()
        let bytes = getfsize(expand("%:p"))
        if bytes <= 0
            return ""
        endif
        if bytes < 1024
            return bytes . "B"
        else
            return (bytes / 1024) . "K"
        endif
    endfunction

    function! CurDir()
        let curdir = substitute(expand('%:p'), '/home/miripiruni', '~', 'g')
        return curdir
    endfunction

    set laststatus=2
    set statusline=\ 
    set statusline+=%n:\ " buffer number
    set statusline+=%t " filename with full path
    set statusline+=\ \ 
    set statusline+=%{&paste?'[paste]\ ':''}
    set statusline+=%{&fileencoding}
    set statusline+=\ \ %Y " type of file
    set statusline+=\ %3.3(%c%) " column number
    set statusline+=\ \ %3.9(%l/%L%) " line / total lines
    set statusline+=\ \ %2.3p%% " percentage through file in lines
    set statusline+=\ \ %{FileSize()}
    set statusline+=%< " where truncate if line too long
    set statusline+=\ \ CurDir:%{CurDir()}

" Ruler
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Leader and Co
    let mapleader = ","
    " Paste
    set pastetoggle=<Leader>p
    " Fast grep
    map <Leader>f :execute "Ack " . expand("<cword>") <Bar> cw<CR>
    " Fix Trailing White Space
    map <leader>ts :%s/\s\+$//e<CR>
    " ,bl show buffers
    nmap <Leader>bl :ls<cr>:b
    " ,bp prev buffer
    nmap <Leader>bp :bp<cr>
    " ,bn next buffer
    nmap <Leader>bn :bn<cr>

" Environment
    cmap w!! %!sudo tee > /dev/null %

" Plugins
    " Solarized
        syntax enable
        let g:solarized_termcolors=256
        set background=dark
        colorscheme solarized
        call togglebg#map("<Leader>b")

    " NERDTree
            nmap <Bs> :NERDTreeToggle<CR>
            let NERDTreeShowBookmarks=1
            let NERDTreeChDirMode=2
            let NERDTreeQuitOnOpen=1
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=0
            let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
            let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

" Restore cursor position on reopen
    function! ResCur()
      if line("'\"") <= line("$")
        normal! g`"
        return 1
      endif
    endfunction

    augroup resCur
      autocmd!
      autocmd BufWinEnter * call ResCur()
    augroup END
