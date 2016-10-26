"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件安装
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "turn off vi compatibility, required for vundle
filetype off "required!
set rtp+=~/.vim/bundle/vundle/ "required!
call vundle#rc() "required!
Plugin 'gmarik/vundle'
"--------------------------------------------------------------------
Plugin 'airblade/vim-rooter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"--------------------------------------------------------------------
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Lokaltog/vim-easymotion'
"--------------------------------------------------------------------
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
"--------------------------------------------------------------------
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'antlypls/vim-colors-codeschool'
"--------------------------------------------------------------------
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
"--------------------------------------------------------------------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"--------------------------------------------------------------------
filetype plugin indent on "required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------界面设置---------------------------------------------
set guioptions-=m "去掉菜单
set guioptions-=T "不显示工具栏
set guioptions-=L "把gui左边的滑动条去掉
set shortmess=atI "启动的时候不显示援助乌干达儿童的提示
set cmdheight=1 "设定命令行的行数为 1
set laststatus=2 "显示状态栏 (默认值为 1, 无法显示状态栏)
set number "显示行号
set ruler "打开状态栏标尺
set guifont=Liberation\ Mono\ for\ Powerline\ 11
set guitablabel=%N#\%t\ %M  "设置tab页显示编号
"---------------基本设置---------------------------------------------
set fileencodings=utf-8,gb2312,gbk,gb18030
set nobackup
set noswapfile
set bufhidden=hide
set history=50 "history文件中需要记录的行数
set backspace=2 "使回格键（backspace）正常处理indent, eol, start等
set mouse=a "可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set formatoptions=tcrqn "自动格式化
set foldenable "开始折叠
set foldmethod=indent "设置缩进折叠
set expandtab "设定取消tab符，改为空格代替
set shiftwidth=2 "设定 < 和 > 命令移动时的宽度为 2
set tabstop=2 "设定tab的空格数
set ignorecase smartcase "搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch "搜索时高亮显示被找到的文本
set autoindent "开新行的时候，自动对齐缩进
set noerrorbells "关闭错误信息响铃
set isk+=- "将-连接符也设置为单词
set scrolloff=3 "上下滚动的时候留出3行
set sidescrolloff=8 "左右滚动的时候,留出8个字符
autocmd BufWritePre * :%s/\s\+$//e "保存的时候,自动去掉行尾空格
let g:netrw_browsex_viewer="setsid xdg-open" "Xfce桌面不能正常使用gx，需要设置一下
autocmd! bufwritepost .vimrc source % "vimrc保存的时候自动应用
"---------------换行设置---------------------------------------------
set wrap "自动换行
set linebreak
set textwidth=100 fo+=Mm "100字符换行
set colorcolumn=+1 "101字符提示
set synmaxcol=128 "这个默认值是3000导致vim处理大行文本时卡顿"
set display=lastline "长行不显示@
nnoremap j gj
nnoremap k gk
"---------------ColorScheme------------------------------------------
syntax on
set background=dark
let modDay = (strftime("%d"))%3
let currentHour = strftime("%H")
if modDay == 0
  if currentHour >= 8 && currentHour < 16
    colorscheme gruvbox
  else
    colorscheme badwolf
  endif
else
  if currentHour >= 8 && currentHour < 16
    colorscheme codeschool
  else
    colorscheme molokai
  endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> <Nop>
nmap . <Nop>
nmap r <Nop>
nmap q <Nop>
nmap Q <Nop>
nmap S <Nop>
nmap R <Nop>
nmap K <Nop>
imap <F1> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
nmap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l
"---------------tab快捷键设置----------------------------------------
map  <silent><A-n> :tabnew<CR>
map  <silent><A-q> :tabc<CR>
nmap <silent><A-1> :tabn 1<cr>
nmap <silent><A-2> :tabn 2<cr>
nmap <silent><A-3> :tabn 3<cr>
nmap <silent><A-4> :tabn 4<cr>
nmap <silent><A-5> :tabn 5<cr>
nmap <silent><A-6> :tabn 6<cr>
nmap <silent><A-7> :tabn 7<cr>
nmap <silent><A-8> :tabn 8<cr>
nmap <silent><A-9> :tabn 9<cr>
nmap <silent><A-0> :tabn 10<cr>
nmap <silent><A-j> :tabp<cr>
nmap <silent><A-k> :tabn<cr>
nmap <silent><A-h> :call TabMove(-1) <CR>
nmap <silent><A-l> :call TabMove(1)<CR>
"---------------leader快捷键设置-------------------------------------
let mapleader = ","
vmap <Leader>c "+y
map  <Leader>v "+p
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>g gg=G
nmap <leader>o :tabe<space>
nmap <leader>/ :nohlsearch<CR>
nmap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR>
nmap <leader>r :TernRename<cr>
vmap <Leader>t :Tab<space>/
nmap <leader>s :call Search()<CR>
"---------------插件快捷键设置---------------------------------------
map  <silent><A-t> :NERDTreeToggle<CR>
imap <silent><A-t> <ESC>:NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------NerdTreeTab------------------------------------------
let g:nerdtree_tabs_synchronize_view = 0
"let g:nerdtree_tabs_autofind = 1 "自动找到新tab所在的tree位置
"---------------CtrlP------------------------------------------------
map <C-b> :CtrlPBuffer<CR>
let g:ctrlp_mruf_include = '\.js$\|\.css$|\.scss$|\.html$' "只记录.js .css .scss .html文件
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"---------------CtrlSF-----------------------------------------------
map <C-f> :CtrlSF<space>
let g:ctrlsf_width = '40%'
let g:ctrlsf_ignore_dir = [".meteor","node_modules"]
"---------------AirLine----------------------------------------------
let g:airline_powerline_fonts = 1   "这个是安装字体后(https://github.com/powerline/fonts) 必须设置此项
let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
"---------------vim-jsx----------------------------------------------
let g:jsx_ext_required = 0
"---------------vim-javascript---------------------------------------
let javascript_enable_domhtmlcss=1 " 打开javascript对dom、html和css的支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编程环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd ~/working
autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif "如果未指定文件类型,文件类型为javascript
autocmd Filetype go,coffee,javascript,json,less,scss,html,ruby setlocal nowrap|setlocal cursorline "这些文件特殊对待
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! Search()
  let keyword = expand("<cword>")
  let url = "https://www.baidu.com/s?wd=" . keyword
  silent exec "!google-chrome '".url."'"
endfun
function! TabMove(direction)
  let ctpn=tabpagenr()
  if a:direction < 0
    execute "tabmove ".(ctpn - 2)
  else
    execute "tabmove ".(ctpn + 1)
  endif
endfunction
fun! Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"TODO nerdtree t 目录以后，新tab页里目录需要刷新
"TODO 高亮当前标签页
