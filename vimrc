set nocompatible              " required
filetype off                  " required

" 显示行号
" set nu
" 支持鼠标点击
set mouse=a

" 新建".sh,.py"文件，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
" 定义注释
function SetComment()
    call setline(1,"\# *************************************")
    call append(line("."),"\# File Name: ".expand("%"))
    call append(line(".")+1,"\# Author:  Xu Yong")
    call append(line(".")+2,"\# Mail: 18810630236@163.com")
    call append(line(".")+3,"\# Create Time: ".strftime("%c"))
    call append(line(".")+4,"\# Info: ")
    call append(line(".")+5,"\# *************************************")
    call append(line(".")+6,"\#")
endfunction
" 定义函数SetTitle，自动插入文件头
function SetTitle()
if expand("%:e") == "sh"
    call SetComment()
    call append(line(".")+7,"\#!/usr/bin/env bash")
endif
if expand("%:e") == "py"
    call SetComment()
    call append(line(".")+7,"\#!/usr/bin/env python")
    call append(line(".")+8,"\# -*-coding:utf-8-*-")
endif
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
endfunction


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 自动缩进
Plugin 'vim-scripts/indentpython.vim'
" ******************************
" 浏览文件系统的树形资源管理配置
" ******************************
Bundle 'scrooloose/nerdtree'
" 打开文件自动打开树形资源管理
autocmd vimenter * NERDTree
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 设置打开/关闭树形资源管理快捷键：Ctrl+a
map <c-a> :NERDTreeToggle<CR>
" 设置展开收起图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 如果只剩下资源管理界面则自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ******************************
" 信息栏模块
" ******************************
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" let g:airline_section_b = '%(strftime("%C"))'
" let g:airline_section_y = 'BN: %{bufnr("%")}'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" 设置信息栏模板
let g:airline_theme='tomorrow'

" ******************************
" 任务栏模块
" ******************************
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
" 切换前一个文档快捷键
map <F11> :MBEbp<CR>
" 切换后一个文档快捷键
map <F12> :MBEbn<CR>