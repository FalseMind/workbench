set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/ " required!
call vundle#rc() " required!
Bundle 'gmarik/vundle'
" ````````````````````````````````````````````````````````````````````
Bundle 'molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle "groenewege/vim-less"
Bundle "elzr/vim-json"
Bundle "tpope/vim-markdown"
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"
Bundle 'Yggdroot/indentLine'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tmhedberg/SimpylFold'
Bundle 'vimwiki/vimwiki'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-rooter'
Bundle 'kien/ctrlp.vim'
Bundle 'dyng/ctrlsf.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
"````````````````````````````````````````````````````````````````````
filetype plugin indent on " required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 视觉效果
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"窗口启动时的位置与大小
winpos 135 135
set lines=18 columns=90
"set guifont=Monospace\ 15
set guifont=DejaVu\ Sans\ Mono\ 15
"set guifont=Liberation\ Mono\ 15
"highlight StatusLine guifg=#383838 guibg=#76EE00 "状态行颜色
"set showmatch "匹配到的高亮
set guioptions-=m "去掉菜单
set guioptions-=T "不显示工具栏
set guioptions-=L "把gui右边的滑动条去掉
set linespace=5 "字符间插入的像素行数目
set nocursorline "不高亮光标所在行
"set noendofline binary
set wrap "自动换行
set synmaxcol=128 "这个默认值是3000导致vim处理大行文本时卡顿"
set display=lastline "长行不显示@
"set linebreak
"set textwidth=78 fo+=Mm
nnoremap j gj
nnoremap k gk
set number "显示行号
set ruler "打开状态栏标尺
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 功能设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,chinese,latin-1
set shell=/bin/bash
set nocompatible " 不要使用vi的键盘模式，而是vim自己的
set history=100 " history文件中需要记录的行数
set nobackup
set noswapfile
syntax on " 语法高亮
set bufhidden=hide
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set formatoptions=tcrqn " 自动格式化
set expandtab " 设定取消tab符，改为空格代替
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2
set autochdir " 自动切换当前目录为当前文件所在的目录
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch " 搜索时高亮显示被找到的文本
set smartindent " 开启新行时使用智能自动缩进
set noerrorbells " 关闭错误信息响铃
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set foldenable " 开始折叠
set foldmethod=indent " 设置缩进折叠
set isk+=- "将-连接符也设置为单词
"-----------------------------------------------------------------
"快捷键设置
"-----------------------------------------------------------------
let mapleader = ","
nnoremap <leader>o :tabe<space>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR> ",8来更改文件编码
nnoremap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> "空格控制折叠
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent><leader>/ :nohlsearch<CR> ",/来清空搜索高亮
"-----------------------------------------------------------------
"Alt + 1-5 切换5个tab页
"-----------------------------------------------------------------
map <silent><F2> :tabclose<CR>
map <silent><F5> :tabnew<CR>
nmap <silent><M-j> :tabp<CR>
nmap <silent><M-k> :tabn<CR>
nmap <silent><M-1> :tabnext 1<CR>
nmap <silent><M-2> :tabnext 2<CR>
nmap <silent><M-3> :tabnext 3<CR>
nmap <silent><M-4> :tabnext 4<CR>
nmap <silent><M-5> :tabnext 5<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <F1> <C-R>=strftime("%c")<CR>
map <F3> :GundoToggle<CR>
imap <F3> <ESC> :GundoToggle<CR>
map <silent><F4> :NERDTreeToggle<CR>
imap <silent><F4> <ESC>:NERDTreeToggle<CR>
nnoremap <silent><leader>c :pclose<CR>
nnoremap <C-F> :CtrlSF<space>
"colorscheme molokai "颜色
set background=dark
colorscheme solarized
"airline设置
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
let g:ctrlp_mruf_max = 50 "ctrlP mrufiles 记录50个最近打开的
let g:ctrlp_mruf_include = '\.js$\|\.html$' "只记录.js .html文件
let g:ctrlsf_width = '40%'
nnoremap <leader>gd :Gvdiff<CR> "仅对当前文件有效
nnoremap <leader>gw :Gwrite<CR> "git add  仅对当前文件有效
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR> "git commit
nnoremap <leader>gp :Git push<CR> "git commit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编程环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype javascript,html,ruby setlocal nowrap|setlocal cursorline|setlocal colorcolumn=80
