set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
Plugin 'lyuts/vim-rtags'
Plugin 'rhysd/vim-clang-format'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'SuperTab'
" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

let mapleader=";"
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_Auto_Open = 1
"let g:clang_format#auto_format_on_insert_leave=1    "退出插入模式时自动格式化
set nu
set mouse=a
set list
set hlsearch
set tags=tags;/

set listchars=tab:>-,trail:-
set ts=4
set shiftwidth=2
set expandtab
set autoindent

let NERDTreeShowHidden=1
"let mapleader = ","  
"let g:mapleader = ","  

map <F2> :NERDTreeToggle<CR>
map <Leader>c :Ack!<Space>
map <F3> :Tlist<CR>
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format.py<CR>

nmap <S-s> :cs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <S-g> :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <S-c> :cs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <S-t> :cs find t <C-R>=expand("<cword>")<CR><CR> 
"调用ag进行搜索
if executable('ag')
let g:ackprg = 'ag --vimgrep'
endif
"高亮搜索关键词
let g:ackhighlight = 1

set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb
endif

syntax on

