set nocompatible               " be iMproved
filetype on                    " required!
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles
    Bundle 'gmarik/vundle'
    " Misc
        Bundle 'L9'
        Bundle 'spacehi.vim'
    "Buffer
        Bundle 'lastpos.vim'
        Bundle 'bufpos'
        Bundle 'buftabs'
    " Interface
        Bundle 'molokai'
        Bundle 'altercation/vim-colors-solarized.git'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'scrooloose/syntastic'
        Bundle 'scrooloose/nerdtree'
    " C/C++
        Bundle 'a.vim'
        Bundle 'taglist.vim'
    " Python/Django
        Bundle 'python.vim'
        Bundle 'nvie/vim-pep8'
        Bundle 'pyflakes.vim'
        Bundle 'indent/python.vim'

filetype plugin indent on     " required!

" Settings
    " Tabs
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set expandtab
        set smarttab
        set autoindent
        set smartindent
        set backspace=indent,eol,start
    " Search
        set hlsearch
        set incsearch
        set ignorecase
        set smartcase
    " Misc
        set hidden
        set cursorline
        set showtabline=1
        set wrap
        set encoding=utf-8
        set fileencodings=utf8,cp1251
        set wildmenu
        set wildignore+=.hg,.git,.svn
        set wildignore+=*.DS_Store
        set wildignore+=*.pyc
        set title
        set showcmd
        set nolist

        if version >= 703
            set colorcolumn=132
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
        let curdir = substitute(expand('%:p'), '/Users/rbtz', '~', 'g')
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
    nmap <Leader>bl :ls<cr>:b
    nmap <Leader>bp :bp<cr>
    nmap <Leader>bn :bn<cr>

" Temp dirs
    set backupdir=~/.vim/backup,/tmp
    set directory=~/.vim/swp//,/tmp

" Plugins
    " Solarized
        syntax enable
        set background=dark
        colorscheme solarized

    " NERDTree
        nmap <Bs> :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

    " Syntactic
        let g:syntastic_cpp_compiler_options = '-std=c++0x'

    " buftabs
        :noremap <C-left> :bprev<CR>
        :noremap <C-right> :bnext<CR>

    " Tags
        nmap <Del> :TlistToggle<CR>

" Autocmds
    autocmd FileType c,cpp set tabstop=8 | set shiftwidth=8 | set softtabstop=8 | set noexpandtab
    autocmd FileType py set tabstop=4 | set shiftwidth=4 | set softtabstop=4 | set expandtab
