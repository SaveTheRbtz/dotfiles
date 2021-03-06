set nocompatible               " be iMproved
filetype on                    " required!
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" Plugins
    Plugin 'gmarik/Vundle.vim'
    " Misc
        Plugin 'L9'
        Plugin 'spacehi.vim'
        Plugin 'vim-scripts/haproxy'
        Plugin 'nacitar/terminalkeys.vim'
        Plugin 'godlygeek/tabular'
    " Statusline
        Plugin 'bling/vim-airline'
    " Buffer
        Plugin 'lastpos.vim'
        Plugin 'bufpos'
    " Colorschemes
        Plugin 'molokai'
        Plugin 'altercation/vim-colors-solarized'
    " Interface
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'scrooloose/syntastic'
        Plugin 'scrooloose/nerdtree'
        Plugin 'kien/ctrlp.vim'
    " C/C++
        Plugin 'a.vim'
        Plugin 'taglist.vim'
    "Lua
        Plugin 'xolox/vim-misc'
        Plugin 'xolox/vim-lua-inspect'
    " Go
        Plugin 'fatih/vim-go'
        Plugin 'majutsushi/tagbar'
        "Plugin 'Valloric/YouCompleteMe'
    " Python/Django
        Plugin 'python.vim'
        Plugin 'nvie/vim-pep8'
        Plugin 'pyflakes.vim'
    " SCM
        Plugin 'tpope/vim-fugitive'
    " Templaters
        Plugin 'lepture/vim-jinja'
    " Puppet
        Plugin 'rodjek/vim-puppet'
    " Markdown
        Plugin 'plasticboy/vim-markdown'
call vundle#end()            " required
filetype plugin indent on    " required

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

        set ttyfast
        set splitbelow
        set splitright

" Russian langmap
    set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>,Ё\~

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
    nmap <Leader>d :bd<cr>

" Temp dirs
    set backupdir=~/.vim/backup,/tmp
    set directory=~/.vim/swp//,/tmp

" Plugins
    " Status line
        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled = 1
        " Show just the filename
        let g:airline#extensions#tabline#fnamemod = ':t'
        set laststatus=2

    " Solarized
        syntax enable
        set term=xterm-256color
        set t_ut=
        set t_Co=256
        set background=dark
        "let g:solarized_termtrans=1
        let g:solarized_termcolors=256
        let g:solarized_visibility="high"
        let g:solarized_contrast="high"
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

    " Lua
        let g:lua_inspect_events = ''
        imap <F6> <C-o>:LuaInspectToggle<CR>
        nmap <F6>      :LuaInspectToggle<CR>

    " Go
        au FileType go nmap <Leader>i <Plug>(go-info)
        au FileType go nmap <Leader>gd <Plug>(go-doc)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <leader>c <Plug>(go-coverage)
        au FileType go nmap gd <Plug>(go-def)
        au FileType go nmap <Leader>ds <Plug>(go-def-split)
        au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
        au FileType go nmap <Leader>dt <Plug>(go-def-tab)
        au FileType go nested :TagbarOpen

        nnoremap <leader>l :TagbarToggle<CR>

        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
        \ }

" Autocmds
    autocmd FileType c,cpp set tabstop=8 | set shiftwidth=8 | set softtabstop=8 | set noexpandtab
    autocmd FileType py set tabstop=4 | set shiftwidth=4 | set softtabstop=4 | set expandtab
    autocmd BufRead,BufNewFile *.go set filetype=go
    autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,*/nginx-*.conf if &ft == '' | setfiletype nginx | endif
    autocmd BufRead,BufNewFile haproxy* set ft=haproxy
