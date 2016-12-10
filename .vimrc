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

"color ron "theme

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
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"autocmd InsertEnter * se cul

set novisualbell

set lcs=tab:\|\ ,nbsp:%,trail:-

set nobackup

set showmatch

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
"tags
"==============================
"set tag=tag_list
"set tags=$PWD/tags
":tag func

"==============================
"files 
"==============================
filetype off

filetype indent on

set nobackup

set nowritebackup

"******************************
"Plugin
"******************************
"==============================
"Config Using Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim
"==============================
 "set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
 Plugin 'bling/vim-airline'
 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
 "Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
 "Plugin 'L9'
 " Git plugin not hosted on GitHub
 "Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
 Plugin 'scrooloose/nerdtree'
 
 
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 "Plugin 'ascenator/L9', {'name': 'newL9'}
 "All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
 ":PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to
 "auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this lin

"==============================
"airline
"==============================
let g:airline_right_sep=''
set laststatus=2



"************************************
"Custom 
"************************************

"==============================
"key mapping
"==============================
let mapleader = ','

" compile and run
map <F5> :call CompileRunSimpleCpp()<CR>
imap <F5> <ESC>:call CompileRunSimpleCpp()<CR>
map <F9> :call Markp()<CR>
"+++plugin
"+ nerdtree
map <leader>f :NERDTree<CR>






"==============================
"Funciton
"===============================

autocmd BufNewFile *.c,*.cc,*.cpp,*.java,*.sh,*.py exec ":call SetHead()"
autocmd BufWritePre,FileWritePRE *.c,*.cc,*.cpp,*.java,*.sh,*.py exec ":call SetUpdateTime() "
"set cursor to th end
autocmd BufNewFile * normal G 

func SetHead()
"custom head
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
    exec "normal G"
endfunc


func SetUpdateTime()
"Updat Modified time
    let l:pos = [line("."),col(".")]
    let l:time = strftime("%Y-%m-%d %H:%M:%S")
    call cursor(1,1)
    if search ('Last Modified','w',30) != 0
	let l:line =  substitute(getline(line(".")),'\d\{4\}-.*', ''.l:time ,'g') 
    call setline(l:num,l:line)
   endif
    call cursor(l:pos)
endfunc

func! CompileRunSimpleCpp()
    exec "w"
    exec "!g++ -std=c++11 % -o %<"
    exec "! ./%<"
endfunc

func Markp()
    exec "mp"
endfunc
