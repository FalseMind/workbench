" File              : /Users/mantak/.vimrc
" Author            : Mantak <mantak.cn@gmail.com>
" Date              : 2017-09-05
" Last Modified Date: 2018-04-26
" Last Modified By  : Mantak <mantak@hotmail.com>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件安装
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                     " be iMproved, required
filetype off                         " required
set rtp+=~/.vim/bundle/Vundle.vim    " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"--------------------------------------------------------------------
Plugin 'CodeFalling/fcitx-vim-osx'
Plugin 'airblade/vim-rooter'
Plugin 'alpertuna/vim-header'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"--------------------------------------------------------------------
Plugin 'kien/ctrlp.vim'
Plugin 'jremmen/vim-ripgrep'
Plugin 'Lokaltog/vim-easymotion'
"--------------------------------------------------------------------
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive.git'
"--------------------------------------------------------------------
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
"--------------------------------------------------------------------
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'briancollins/vim-jst'
Plugin 'fleischie/vim-styled-components'
Plugin 'jparise/vim-graphql'
"--------------------------------------------------------------------
Plugin 'chemzqm/wxapp.vim'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Mantak/mantak-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

"--------------------------------------------------------------------
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------界面设置---------------------------------------------
set guioptions-=m "去掉菜单
set guioptions-=T "不显示工具栏
set guioptions-=L "把gui左边的滑动条去掉
set shortmess=atI "启动的时候不显示援助乌干达儿童的提示
set cmdheight=1   "设定命令行的行数为 1
set laststatus=2  "显示状态栏 (默认值为 1, 无法显示状态栏)
set number        "显示行号
set ruler         "打开状态栏标尺
set cursorcolumn  "打开竖线提示当前所在列
set guifont=Menlo\ for\ Powerline:h15
" au TabEnter * let t:current = 1
" au TabLeave * let t:current = 0
" set guitablabel=%{exists('t:current')&&t:current?'@_@':''}%N#\ %t\ %M
" set ambiwidth=double  "设置Unicode字符可以正确显示
"---------------基本设置---------------------------------------------
xnoremap p pgvy  "阻止覆盖的时候复制
set fileencodings=utf-8,gb2312,gbk,gb18030
set nobackup
set noswapfile
set bufhidden=hide
set history=50 "history文件中需要记录的行数
set backspace=2 "使回格键（backspace）正常处理indent, eol, start等
set mouse=a "可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set formatoptions=tcrqn "自动格式化
"set maxmempattern=1000
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
" let g:netrw_browsex_viewer="setsid xdg-open" "Xfce桌面不能正常使用gx，需要设置一下
autocmd BufWritePre * silent! :%s/\s\+$//e "保存的时候,自动去掉行尾空格
autocmd BufWritePre * silent! :retab "保存的时候,自动将tab换成空格
" autocmd BufWritePre * silent! :v/\_s*\S/d "保存的时候,自动删除末尾空行
" autocmd! bufwritepost .vimrc source % "vimrc保存的时候自动应用
"---------------换行设置---------------------------------------------
set nowrap linebreak nolist
set textwidth=100 fo+=Mm "100字符换行
set colorcolumn=+1 "81字符提示
set synmaxcol=255 "每行高亮显示的最大字符数，超过了，就不会高亮渲染了。默认是3000
set display=lastline "长行不显示@
nnoremap j gj
nnoremap k gk
"---------------ColorScheme------------------------------------------
syntax on
let macvim_skip_colorscheme=1
let hour = strftime("%H")
if 8 <= hour &&  hour < 16
  set background=light
else
  set background=dark
endif
let modDay = (strftime("%d"))%3
if modDay == 0
  colorscheme gruvbox
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
imap <F2> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
nmap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>
"---------------窗口快捷键设置----------------------------------------
map <D-h> <C-w>h
map <D-j> <C-w>j
map <D-k> <C-w>k
map <D-l> <C-w>l
"---------------tab快捷键设置----------------------------------------
" map  <silent><D-t> :tabnew<CR>
" map  <silent><D-w> :tabc<CR>
nmap <silent><D-1> :tabn 1<cr>
nmap <silent><D-2> :tabn 2<cr>
nmap <silent><D-3> :tabn 3<cr>
nmap <silent><D-4> :tabn 4<cr>
nmap <silent><D-5> :tabn 5<cr>
nmap <silent><D-6> :tabn 6<cr>
nmap <silent><D-7> :tabn 7<cr>
nmap <silent><D-8> :tabn 8<cr>
nmap <silent><D-9> :tabn 9<cr>
nmap <silent><D-0> :tabn 10<cr>
" nmap <silent><M-j> :tabp<cr>
" nmap <silent><M-k> :tabn<cr>
"---------------leader快捷键设置-------------------------------------
let mapleader = ","
nmap <leader>g gg=G
nmap <leader>i <c-w>F
nmap <leader>t <c-w>gf
nmap <leader>o :tabe<space>
nmap <leader>/ :nohlsearch<CR>
nmap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR>

map <Leader>a :AddHeader<CR>
nmap <leader>s :call Search()<CR>
nmap <leader>c :call SearchGithub()<CR>
map <Leader>d :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>

map <Leader>f :Rg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------- EasyMotion    ---------------------------------------
map <Leader>, <Plug>(easymotion-bd-jk)
map <Leader> <Plug>(easymotion-prefix)
"-------------- YouCompleteMe ---------------------------------------
let g:ycm_max_num_candidates = 10
" let g:ycm_max_diagnostics_to_display = 20
let g:ycm_disable_for_files_larger_than_kb = 0
"-------------- wxapp.vim -------------------------------------------
autocmd File              : ~/.vimrc
"-------------- Ultisnips -------------------------------------------
let g:UltiSnipsExpandTrigger="<c-o>"
"-------------- NerdTree --------------------------------------------
"Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let NERDTreeWinPos=1 "窗口居右
set completeopt=menu  "不要打开提示框
" map <D-e> :NERDTreeToggle<CR>
" map  <fg> :call NERDTreeFindToggle()<CR>
" 切换NerdTree,不使用NERDTreeToggle的原因是，这个命令无法定位到文件位置
map  <silent><D-e> :call NERDTreeFindToggle()<CR>
imap <silent><D-e> <ESC>:call NERDTreeFindToggle()<CR>
func! NERDTreeFindToggle()
  if g:NERDTree.IsOpen()
    execute ':NERDTreeClose'
  else
    if !(getline(1) ==# '' && 1 == line('$'))
      :NERDTreeFind
    else
      :NERDTreeCWD
    endif
  endif
endfunction
"-------------- CtrlP -----------------------------------------------
let g:ctrlp_map = '<D-p>'
map <Leader>p :CtrlPBuffer<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
"-------------- vim-ripgrep -----------------------------------------
let g:rg_highlight = 'true'
"-------------- AirLine ---------------------------------------------
let g:airline_powerline_fonts = 1   "这个是安装字体后(https://github.com/powerline/fonts) 必须设置此项
let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
"-------------- vim-jsx ---------------------------------------------
let g:jsx_ext_required = 0
"-------------- syntastic -------------------------------------------
let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '->'
let g:syntastic_warning_symbol = '->'
let g:syntastic_error_style_symbol = '->'
let g:syntastic_warning_style_symbol = '->'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
"ㄨ
"-------------- AddHeader -------------------------------------------
let g:header_field_author = 'Mantak'
let g:header_field_author_email = 'mantak@hotmail.com'
let g:header_field_timestamp_format = '%Y-%m-%d'
let g:header_auto_add_header = 0
"-------------- VimPrettier -----------------------------------------
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#print_width = 100
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
" autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编程环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd ~/Company
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Search()
  let keyword = expand("<cword>")
  let url = "https://www.baidu.com/s?wd=" . keyword
  silent exec "!open '".url."'"
endfun
func! SearchGithub()
  let keyword = expand("<cword>")
  let url = "https://www.github.com/search?q=" . keyword
  silent exec "!open '".url."'"
endfun
" au BufRead,BufNewFile              : _.vimrc
au FocusGained * call Fcitx2en()  "进入vim，自动切换为英文，免去键盘问题
" 重写gx方法
let g:netrw_nogx = 1 " disable netrw's gx mapping.
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;)]*')
  echo s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap gx ::call HandleURL()<CR>



" let g:LargeFile = 1024 * 500
" augroup LargeFile
"  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
" augroup END
"
" function LargeFile()
"  " no syntax highlighting etc
"  set eventignore+=FileType
"  " save memory when other file is viewed
"  setlocal bufhidden=unload
"  " is read-only (write with :w new_filename)
"  setlocal buftype=nowrite
"  " no undo possible
"  setlocal undolevels=-1
"  " display message
"  autocmd VimEnter *  echo "文件大于 " . (g:LargeFile / 1024) . " KB, 以只读模式打开"
" endfunction

" 常用命令 """""""""""""""""""""""""""""""""""""""""""""""""""
" Gedit
" Gstatus  dv
" Glog
"   :cnext
"   :cprev
"   :copen
" Gvdiff
" Gcommit
" ctrlP
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
