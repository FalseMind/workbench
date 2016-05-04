" ````````````````````````````````````````````````````````````````````
"确保安装了node npm go python
" YouCompleteMe的安装,执行之前会很卡,关闭消耗资源的进程
"cd ~/.vim/bundle/tern_for_vim && npm install
"cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer --tern-completer
" ````````````````````````````````````````````````````````````````````
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
"if !isdirectory(expand("~/.vim/bundle/tern_for_vim/.git"))
"  !git clone https://github.com/ternjs/tern_for_vim ~/.vim/bundle/tern_for_vim
"endif
"if !isdirectory(expand("~/.vim/Ultisnips"))
"  !git clone https://github.com/Mantak/Ultisnips ~/.vim/Ultisnips
"endif
set nocompatible "turn off vi compatibility, required for vundle
filetype off "required!
set rtp+=~/.vim/bundle/vundle/ "required!
call vundle#rc() "required!
Plugin 'gmarik/vundle'
" ````````````````````````````````````````````````````````````````````
Plugin 'airblade/vim-rooter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
" ````````````````````````````````````````````````````````````````````
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Lokaltog/vim-easymotion'
" ````````````````````````````````````````````````````````````````````
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'
" ````````````````````````````````````````````````````````````````````
Plugin 'molokai'
" ````````````````````````````````````````````````````````````````````
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
" ````````````````````````````````````````````````````````````````````
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"````````````````````````````````````````````````````````````````````
filetype plugin indent on "required!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 视觉效果
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lines=68 columns=168 "设置全屏
set guifont=Liberation\ Mono\ for\ Powerline\ 13
"set showmatch "匹配到的高亮
set guioptions-=m "去掉菜单
set guioptions-=T "不显示工具栏
set guioptions-=L "把gui右边的滑动条去掉
set linespace=5 "字符间插入的像素行数目
set nocursorline "不高亮光标所在行
"set noendofline binary
set wrap "自动换行
set linebreak
set textwidth=78 fo+=Mm
set synmaxcol=128 "这个默认值是3000导致vim处理大行文本时卡顿"
set display=lastline "长行不显示@
nnoremap j gj
nnoremap k gk
set number "显示行号
set ruler "打开状态栏标尺
colorscheme molokai "颜色设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 功能设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash
set fileencodings=utf-8,gb2312,gbk,gb18030
map <F1> <Nop>
nmap q <Nop>
set history=0 " history文件中需要记录的行数
set nobackup
set noswapfile
syntax on " 语法高亮
set bufhidden=hide
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set formatoptions=tcrqn " 自动格式化
set expandtab " 设定取消tab符，改为空格代替
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2
set tabstop=2 "设定tab的空格数
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
set scrolloff=3 "上下滚动的时候留出3行
set sidescrolloff=8 "左右滚动的时候,留出8个字符
"set paste 设置粘贴时不自动换行
"set nopaste 恢复换行
"-----------------------------------------------------------------
"快捷键设置
"-----------------------------------------------------------------
let mapleader = ","
nmap <leader>g gg=G
nmap <leader>o :tabe<space>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
vmap <Leader>c "+y
nmap <Leader>v "+p
nmap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR> ",8来更改文件编码
nmap <silent><leader>/ :nohlsearch<CR> ",/来清空搜索高亮
imap <F1> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
nmap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l
map  <leader>u :call HandleURL()<cr>
"-----------------------------------------------------------------
"Alt + 1-5 切换5个tab页
"-----------------------------------------------------------------
map  <silent><F5> :tabnew<CR>
map  <silent><F2> :tabclose<CR>
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
let b:javascript_fold=1 " 设置javascript折叠为1层
let javascript_enable_domhtmlcss=1 " 打开javascript对dom、html和css的支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent><leader>d :TernRefs<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent><F4> :NERDTreeToggle<CR>
imap <silent><F4> <ESC>:NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <C-B> :CtrlPBuffer<CR>
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-F> :CtrlSF<space>
"map  <leader>f :CtrlSF<cr>
let g:ctrlsf_width = '40%'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map  <leader>f :TernDef<cr>
map  <leader>d :TernDoc<cr>
map  <leader>r :TernRefs<cr>
map  <leader>h :TernRename<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips设置
"let g:UltiSnipsEditSplit="horizontal"
"let g:UltiSnipsSnippetDirectories=['Ultisnips']
"let g:UltiSnipsSnippetsDir = '~/.vim/Ultisnips'
"let g:UltiSnipsJumpForwardTrigger = '<Tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
"let g:UltiSnipsExpandTrigger = "<C-o>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1   "这个是安装字体后(https://github.com/powerline/fonts) 必须设置此项
let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_mruf_include = '\.js$\|\.html$' "只记录.js .html文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编程环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd ~/Apples/working
autocmd BufEnter * if &filetype == "" | setlocal ft=javascript | endif
"如果未指定文件类型,文件类型为javascript
autocmd Filetype go,coffee,javascript,html,ruby setlocal nowrap|setlocal cursorline|setlocal colorcolumn=79 "这些文件特殊对待
autocmd BufWritePre * :%s/\s\+$//e "保存的时候,自动去掉行尾空格
autocmd! bufwritepost .vimrc source % "vimrc保存的时候自动应用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HandleURL()
  let s:uri = matchstr(getline("."), '\v(https?://|ftp://|file:/{3}|www\.)((\w|-)+\.)+(\w|-)+(:\d+)?(/(\w|[~@#$%^&+=/.?-])+)?')
  echo s:uri
  if s:uri != ""
    "通过下面命令查看当前chorome版本   dpkg --get-selections | grep chrom
    silent exec "!chromium-browser '".s:uri."'"
  else
    echo "当前行未发现链接地址"
  endif
endfunction
