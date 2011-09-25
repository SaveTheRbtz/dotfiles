set tabstop=4 
set softtabstop=4
set shiftwidth=4 
set expandtab
set ruler
set smartindent
set incsearch

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>,Ё\~

"
" Plugins
"
autocmd syntax * SpaceHi
