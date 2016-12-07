"******************************
"Common Used Config.
"******************************


"==============================
"personal info
"==============================
iabbr emal chengjuntravel.com
iabbr "==  "==============================
iabbr "**  "******************************

"==============================
"Font and BackGround
"==============================

set gfn=Consolas:h14 "font

color evening "theme

"==============================
"close compatible
"==============================
set nocompatible

"==============================
"Searching Part
"==============================
set hlsearch

set incsearch

set ignorecase


"******************************
"coding part
"******************************
set nu "Enable Line numer

syntax enable

set ruler

"autocmd InsertEnter * se cul

set novisualbell

set list lcs=tab:\|\

set nobackup


set encoding=utf-8

set fileencoding=utf-8

"==============================
"indent
"==============================
set autoindent

set smartindent

set cindent

"==============================
"shift words
"==============================
set shiftwidth=4

set softtabstop=4

set noexpandtab

set showcmd


"==============================
"files 
"==============================
filetype on

filetype indent on

"==============================
"plugins
"==============================
filetype plugin on

filetype plugin indent on

"==============================
"key map
"==============================

imap <leader>' ''<ESC>i
                              
"************************************
"Custom Function
"******************************
"==============================
"Tittle
"===============================

autocmd BufNewFile *.c,*.cc,*.cpp,*.java,*.sh,*.py exec ":call SetHead()"
autocmd BufWritePre,FileWritePRE *.c,*.cc,*.cpp,*.java,*.sh,*.py exec ":call SetUpdateTime()"
autocmd BufNewFile * normal G


func SetHead()
    if  &filetype == 'python'
	call setline(1,"# -*-coding:utf-8-*-")
	call append(line("."),"")
	call append(line(".")+1,"\#######################################")
	call append(line(".")+2,"\# ")
	call append(line(".")+3,"\# @Author         Noxaean")
	call append(line(".")+4,"\# @Email          noxaean@gmail.com")
	call append(line(".")+5,"\# @Description  ")
	call append(line(".")+6,"\# @Created        ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+7,"\# @Last Modified  ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+8,"\# ")
	call append(line(".")+9,"\#######################################")
	call append(line(".")+10,"")
    elseif &filetype == 'sh'
	call setline(1,"#! /bin/bash")
	call append(line("."),"")
	call append(line(".")+1,"\#######################################")
	call append(line(".")+2,"\# ")
	call append(line(".")+3,"\# @Author         Noxaean")
	call append(line(".")+4,"\# @Email          noxaean@gmail.com")
	call append(line(".")+5,"\# @Description  ")
	call append(line(".")+6,"\# @Created        ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+7,"\# @Last Modified  ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+8,"\# ")
	call append(line(".")+9,"\#######################################")
	call append(line(".")+10,"")
    else
	call setline(1,"/**************************************")
	call append(line("."),"\*")
	call append(line(".")+1,"\* @Author         Noxaean")
	call append(line(".")+2,"\* @Email          noxaean@gmail.com")
	call append(line(".")+3,"\* @Description  ")
	call append(line(".")+4,"\* @Created        ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+5,"\* @Last Modified  ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+6,"\*")
	call append(line(".")+7,"\****************************************/")
	call append(line(".")+8,"")
    endif
endfunc


func SetUpdateTime()
    call cursor(12,1)
    let cur_time = strftime("%Y-%m-%d %H:%M:%S")
    if search ('Last Modified') != 0
	let num = line('.')
	let line =  substitute(getline(num),'\d\{4\}-.*', ''.cur_time ,'g') 
   endif
    call setline(num,line)
endfunc
