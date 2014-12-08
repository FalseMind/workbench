""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"A使用Vundle来管理插件
" 1下载: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle  2使用: :BundleInstall :BundleInstall! :BundleClean
"B安装youcompleteme的编译环境
"sudo apt-get install build-essential cmake
"sudo apt-get install python-dev
"因为该包有点大，手动下载youcompleteme包
":~/.vim/bundle$ git clone https://github.com/Valloric/YouCompleteMe
":~/.vim/bundle/YouCompleteMe$ ./install.sh
"C安装tern支持
":~/.vim/bundle$ git clone https://github.com/marijnh/tern_for_vim
":~/.vimr/bundle/tern_for_vim$ npm install
"下载meteor.js 放到 ~/.vimr/bundle/tern_for_vim/node_modules/tern/plugin 文件夹下
"下载.tern-project放到项目根目录下
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/ " required!
call vundle#rc() " required!
" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'
" ````````````````````````````````````````````````````````````````````
Bundle "groenewege/vim-less"
Bundle "elzr/vim-json"
Bundle "tpope/vim-markdown"
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"

Bundle 'kien/ctrlp.vim'
Bundle 'dyng/ctrlsf.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-rooter'
Bundle 'Yggdroot/indentLine'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'

Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'

Bundle 'molokai'
Bundle 'altercation/vim-colors-solarized'
"````````````````````````````````````````````````````````````````````
filetype plugin indent on " required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 视觉效果
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"窗口启动时的位置与大小
winpos 135 135
set lines=18 columns=90
"set guifont=Monospace\ 15
"set guifont=DejaVu\ Sans\ Mono\ 14
set guifont=Liberation\ Mono\ 15
syntax on " 语法高亮
highlight StatusLine guifg=#383838 guibg=#76EE00 "状态行颜色
"set showmatch "匹配到的高亮
set guioptions-=m "去掉菜单,这个很必要，不然会跟alt+1快捷键冲突
set guioptions-=T "不显示工具栏
set guioptions-=L "把gui右边的滑动条去掉
set linespace=5 " 字符间插入的像素行数目
"set shortmess=atI " 启动的时候不显示那个援助索马里儿童的提示
set nowrap " 不要换行
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
"au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
"au BufRead,BufNewFile *.js setf jquery
"let b:javascript_fold=1 " 打开javascript折叠
"let javascript_enable_domhtmlcss=1 " 打开javascript对dom、html和css的支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 功能设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash
set nocompatible " 不要使用vi的键盘模式，而是vim自己的
set history=100 " history文件中需要记录的行数
setlocal noswapfile " 不要生成swap文件，当buffer被丢弃的时候隐藏它
set bufhidden=hide
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set formatoptions=tcrqn " 自动格式化
set expandtab " 设定取消tab符，改为空格代替
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2
set autochdir " 自动切换当前目录为当前文件所在的目录
"filetype plugin indent on " 开启插件
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set smartindent " 开启新行时使用智能自动缩进
set noerrorbells " 关闭错误信息响铃
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ " 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=indent " 设置缩进折叠
set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
set isk+=- "将-连接符也设置为单词
"-----------------------------------------------------------------
"快捷键设置
"-----------------------------------------------------------------
let mapleader = ","
nnoremap <leader>o :vi<space>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
 "空格控制折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"-----------------------------------------------------------------
"Alt + 1-5 切换5个tab页
"-----------------------------------------------------------------
map <F2> :tabclose<CR>
map <F5> :tabnew<CR>
nmap <M-j> :tabp<CR>
nmap <M-k> :tabn<CR>
nmap <M-1> :tabnext 1<CR>
nmap <M-2> :tabnext 2<CR>
nmap <M-3> :tabnext 3<CR>
nmap <M-4> :tabnext 4<CR>
nmap <M-5> :tabnext 5<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <F1> <C-R>=strftime("%c")<CR> 
map <F3> :GundoToggle<CR>
imap <F3> <ESC> :GundoToggle<CR>
map <F4> :NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeToggle<CR>
map <F12> :Calendar<CR> 
nnoremap <leader>c :pclose<CR>
"colorscheme molokai "颜色
set background=dark
colorscheme solarized
"airlin设置
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
"let g:airline#extensions#tabline#show_buffers = 0 "不显示buffers
"let g:airline#extensions#tabline#show_close_button = 0 "不显示关闭button
"let g:airline#extensions#tabline#tab_nr_type = 1 "tab显示序号
"let g:airline#extensions#tabline#fnamemod = ':t' "tab页仅显示文件名，不显示目录
let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页


"ctrlp使用
"ctrl + p 打开窗口， ctrl + f 切换模式， ctrl+t 新tab页打开 ctrl+j/ctrl+k 在结果里移动 ctrl+z 标记多个文件，一起打开
"let g:ctrlp_working_path_mode = 'ra' "ctrl+p最近的.git目录为根目录。有了rooter之后，不再需要
let g:ctrlp_mruf_max = 50 "ctrlP mrufiles 记录50个最近打开的
let g:ctrlp_mruf_include = '\.js$\|\.html$' "只记录.js .html文件


"let g:calendar_frame = 'default'
nnoremap <C-F> :CtrlSF<space>
let g:ctrlsf_width = '40%'
"let g:ctrlsf_auto_close = 0          "不要自动关系搜索结果页
"o, Enter - Jump to file that contains the line under cursor.
"t - Like o but open file in a new tab.
"p - Like o but open file in a preview window.
"O - Like o but always leave CtrlSF window opening.
"T - Lkie t but focus CtrlSF window instead of opened new tab.
"q - Quit CtrlSF window.
"<C-J> - Move cursor to next match.
"<C-K> - Move cursor to previous match.
"YouCompleteMe设置
"let g:ycm_add_preview_to_completeopt = 1
"set completeopt-=preview  "youcompleteme不要自动出现提示窗口
"let g:ycm_autoclose_preview_window_after_insertion = 1 "Esc自动关闭弹出窗口
"let g:ycm_autoclose_preview_window_after_completion = 1 "输入完毕自动关闭提示窗口

" 更改了vim之后，自动生效，无需重启
augroup VimrcSo
au!
autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END

"tab 替换为空格的命令 :%s/\t/    /g
