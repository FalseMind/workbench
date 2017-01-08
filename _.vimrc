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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"--------------------------------------------------------------------
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Lokaltog/vim-easymotion'
"--------------------------------------------------------------------
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"--------------------------------------------------------------------
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rcabralc/rcabralc-colorscheme.vim'
"--------------------------------------------------------------------
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
"--------------------------------------------------------------------
Plugin 'SirVer/ultisnips'
Plugin 'Mantak/mantak-vim'
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
au TabEnter * let t:current = 1
au TabLeave * let t:current = 0
set guitablabel=%{exists('t:current')&&t:current?'@_@':''}%N#\ %t\ %M
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
let g:netrw_browsex_viewer="setsid xdg-open" "Xfce桌面不能正常使用gx，需要设置一下
autocmd BufWritePre * silent! :%s/\s\+$//e "保存的时候,自动去掉行尾空格
autocmd BufWritePre * silent! :v/\_s*\S/d "保存的时候,自动删除末尾空行
autocmd BufWritePre * silent! :retab "保存的时候,自动将tab换成空格
autocmd! bufwritepost .vimrc source % "vimrc保存的时候自动应用
autocmd InsertLeave * call Fcitx2en() "退出输入模式,自动出中文输入,需fcitx支持
"---------------换行设置---------------------------------------------
set wrap linebreak nolist
set textwidth=80 fo+=Mm "80字符换行
set colorcolumn=+1 "81字符提示
set synmaxcol=128 "这个默认值是3000导致vim处理大行文本时卡顿"
set display=lastline "长行不显示@
nnoremap j gj
nnoremap k gk
"---------------ColorScheme------------------------------------------
syntax on
let hour = strftime("%H")
if 8 <= hour &&  hour < 16
  set background=light
else
  set background=dark
endif
let modDay = (strftime("%d"))%3
if modDay == 0
  colorscheme gruvbox
  "colorscheme rcabralc
elseif modDay == 1
  colorscheme solarized
else
  colorscheme PaperColor
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
"---------------窗口快捷键设置----------------------------------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-Up> :resize +5<cr>
map <C-Down> :resize -5<cr>
map <C-Left> :vertical resize -5<cr>
map <C-Right> :vertical resize +5<cr>
nmap <silent><F12> :!google-chrome % &<CR>
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
vmap <Leader>v "+p
nmap <Leader>v "+p
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>g gg=G
nmap <leader>i <c-w>F
nmap <leader>t <c-w>gf
nmap <leader>o :tabe<space>
nmap <leader>/ :nohlsearch<CR>
nmap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR>
vmap <Leader>t :Tab<space>/
nmap <leader>s :call Search()<CR>
"---------------插件快捷键设置---------------------------------------
map  <silent><A-f> :call ToggleNERDTreeFind()<CR>
imap <silent><A-f> <ESC>:call ToggleNERDTreeFind()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------- Mantak ----------------------------------------------
let $PATH=$PATH . ':/home/mantak/.nvm/versions/node/v6.9.0/bin'
nmap <Leader>ga :!mantak g api<space>
nmap <Leader>da :!mantak d api<space>
nmap <Leader>gp :!mantak g page<space>
nmap <Leader>dp :!mantak d page<space>
nmap <Leader>gc :!mantak g container<space>
nmap <Leader>dc :!mantak d container<space>
nmap <Leader>gcc :!mantak g component<space>
nmap <Leader>dcc :!mantak d component<space>
nmap <Leader>gap :!mantak g adminPage<space>
nmap <Leader>dap :!mantak d adminPage<space>
"-------------- Ultisnips -------------------------------------------
let g:UltiSnipsExpandTrigger="<c-o>"
"-------------- NerdTree --------------------------------------------
"Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"-------------- CtrlP -----------------------------------------------
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
map <A-p> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = { 'dir': '.meteor$\|node_modules$' }
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-o>', '<cr>'],
      \ 'AcceptSelection("h")': ['<c-i>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ }
"-------------- CtrlSF ----------------------------------------------
nmap <C-f> <Plug>CtrlSFPrompt
vmap <C-F> <Plug>CtrlSFVwordPath
nmap <C-F>o :CtrlSFOpen<CR>
let g:ctrlsf_width = '40%'
"-------------- AirLine ---------------------------------------------
let g:airline_powerline_fonts = 1   "这个是安装字体后(https://github.com/powerline/fonts) 必须设置此项
let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
"-------------- vim-jsx ---------------------------------------------
let g:jsx_ext_required = 0
"-------------- syntastic -------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_eslint_exec='/home/mantak/.nvm/versions/node/v6.9.0/bin/eslint'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '⚫'
let g:syntastic_warning_symbol = '⚫'
let g:syntastic_error_style_symbol = '⚪'
let g:syntastic_warning_style_symbol = '⚪'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
"⚫⚪❌❎⛔🌿🍂🍀⛽🌕🍵🌷🌺🍁🎯👽📍📌📦🔍🔎🔘🔥🔯
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编程环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd ~/working
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
fun! Fcitx2en()
  if system("fcitx-remote") == 2
    let l:a = system("fcitx-remote -c")
  endif
endfunction
fun! Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
function! ToggleNERDTreeFind()
  if g:NERDTree.IsOpen()
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction
