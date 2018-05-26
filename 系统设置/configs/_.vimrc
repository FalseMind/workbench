" File              : /Users/mantak/.vimrc
" Author            : Mantak <mantak@foxmail.com>
" Date              : 2018-05-26
" Last Modified Date: 2018-05-26
" Last Modified By  : Mantak <mantak@foxmail.com>
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 安装插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8  "use scriptencoding when multibyte char exists

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')
  "----- 界面插件 ---------------------------------------------------
  Plug 'airblade/vim-rooter'
  Plug 'Mantak/vim-tabber'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "--- 功能增强 -----------------------------------------------------
  Plug 'tpope/vim-vinegar'              "文件目录，替代nerdtree
  Plug 'mhinz/vim-startify'             "最近工作界面
  Plug 'alpertuna/vim-header'           "增加作者信息
  Plug 'kien/ctrlp.vim'                 "快速打开文件
  Plug 'jremmen/vim-ripgrep'            "全项目搜索
  Plug 'Lokaltog/vim-easymotion'        "快速定位
  Plug 'jiangmiao/auto-pairs'           "成对的括号
  Plug 'scrooloose/nerdcommenter'       "注释
  "--- Git支持  -----------------------------------------------------
  Plug 'mhinz/vim-signify'              "显示文件中的改动
  Plug 'tpope/vim-fugitive'             "git功能
  "--- 配色方案 -----------------------------------------------------
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'crusoexia/vim-monokai'
  " Plug 'archseer/colibri.vim'         "紫色系，很不错
  "--- 语言支持 -----------------------------------------------------
  Plug 'godlygeek/tabular'                            "markdown需要
  Plug 'plasticboy/vim-markdown'                      "markdown
  Plug 'jparise/vim-graphql'
  Plug 'pangloss/vim-javascript'                      "Javascript
  Plug 'mxw/vim-jsx'                                  "React
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } "Go
  "--- 语法补全 -----------------------------------------------------
  Plug 'ervandew/supertab'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "JS补全
  Plug 'zchee/deoplete-go', { 'do': 'make' }                       "Go补全
  "--- tag 树   -----------------------------------------------------
  Plug 'majutsushi/tagbar'
  "--- 语法检查 -----------------------------------------------------
  Plug 'w0rp/ale'                      "JS和Go都可以检查并格式化
  "--- 代码格式化 ---------------------------------------------------
  Plug 'Chiel92/vim-autoformat'        "其他语言的自动格式
  "--- 翻译工具 -----------------------------------------------------
  " Plug 'VincentCordobes/vim-translate'
  Plug 'echuraev/translate-shell.vim'
  "--- Elixir 配置 --------------------------------------------------
  " Plug 'elixir-editors/vim-elixir'                    "Elixir缩进
  " Plug 'slashmili/alchemist.vim'                      "Elixir提示
  " let g:alchemist_tag_disable = 1
  " Plug 'ludovicchabant/vim-gutentags'                 "tags插件
  " let g:gutentags_cache_dir = '~/.tags_cache'
call plug#end()
"---------------输入法设置-------------------------------------------
  set noimdisable   "普通模式： 只有英文可用
  set iminsert=1    "插入模式： 0 使用上次插入模式的输入法，1使用英文，2使用中文
  " set imsearch=0    "搜索模式下, 0 :lmap is off and IM is off
"---------------界面设置---------------------------------------------
  " set guioptions-=T    "不显示工具栏  macvim本身也没有这个东西
  " set guioptions-=m    "去掉菜单  macvim本身也没这个东西
  " set cmdheight=1      "设定命令行的行数为 1
  " set ruler            "通过airline统一设置
  " set guioptions-=r    "把gui右边的滑动条去掉
  set guioptions=      "去掉gui提供的界面
  set laststatus=2     "保持状态栏打开
  set showtabline=2    "保持tabline打开
  set linespace=1      "这个值可以让macvim可以拉到底部，如果不能，尝试改变为其他值
  set shortmess=atI    "启动的时候不显示援助乌干达儿童的提示
  set number           "显示行号
  set cursorcolumn     "打开竖线提示当前所在列
  set signcolumn=yes   "保持行号左面的提示打开
  set cursorline       "高亮当前行
  set completeopt-=preview "默认不要开启提示窗口
  set guifont=Hermit:h15
  set guifontwide=翩翩体-简
  " set guifontwide=手札体-简
  " set guifont=Menlo\ for\ Powerline:h15
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h15
"---------------基本设置---------------------------------------------
  xnoremap p pgvy  "阻止覆盖的时候复制
  set fileencodings=utf-8,gb2312,gbk,gb18030
  set nobackup
  set noswapfile
  set bufhidden=hide
  set history=50 "history文件中需要记录的行数
  set backspace=2 "使回格键（backspace）正常处理indent, eol, start等
  set mouse= "禁用鼠标
  set foldenable "开始折叠
  set foldmethod=indent "设置缩进折叠
  set foldlevel=1 "超过1层，才会缩进
  set shiftwidth=2 "设定 < 和 > 命令移动时的宽度为 2
  set ignorecase smartcase "搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
  set hlsearch "搜索时高亮显示被找到的文本
  set autoindent "开新行的时候，自动对齐缩进
  set noerrorbells "关闭错误信息响铃
  set isk+=- "将-连接符也设置为单词
  set scrolloff=3 "上下滚动的时候留出3行
  set sidescrolloff=8 "左右滚动的时候,留出8个字符
  autocmd BufWritePre * silent! :%s/\s\+$//e "保存的时候,自动去掉行尾空格
  set expandtab "设定取消tab符，改为空格代替
  set tabstop=2 "设定tab的空格数
  " au BufWritePre * silent! :retab "保存的时候,自动将tab换成空格
"---------------换行设置---------------------------------------------
  set nowrap linebreak nolist
  set textwidth=100 fo+=Mm "100字符换行
  " set colorcolumn=+1 "行长提示
  set synmaxcol=300 "每行高亮显示的最大字符数，超过了，就不会高亮渲染了。默认是3000
  set display=lastline "长行不显示@
  nnoremap j gj
  nnoremap k gk
"---------------ColorScheme------------------------------------------
  syntax on
  let macvim_skip_colorscheme=1
  set background=dark
  let modDay=(strftime("%d"))%2
  " let modDay=(strftime("%d"))%3
  if modDay == 0
    colorscheme monokai
    hi NonText      guifg=#272822 guibg=#272822 "文件末尾
    hi SignColumn   guifg=#FB9633 guibg=#272822 "左侧提示
    hi LineNr       guifg=#8F908A guibg=#272822 "行首数字
    hi CursorLineNR guifg=#FB9633 guibg=#272822 "高亮行首数字
  " elseif modDay == 1
  "   colorscheme colibri
  "   hi NonText      guifg=#3B234B guibg=#3B234B "文件末尾
  else
    colorscheme dracula
    hi NonText      guifg=#282A36 guibg=#282A36 "文件末尾
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
  " imap <F2> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
  nmap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>
"---------------窗口快捷键设置----------------------------------------
  map <D-h> <C-w>h
  map <D-j> <C-w>j
  map <D-k> <C-w>k
  map <D-l> <C-w>l
"---------------tab快捷键设置----------------------------------------
  " map  <silent><D-t> :tabnew<CR>
  map  <silent><D-q> :tabc<CR>
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
"---------------leader快捷键设置-------------------------------------
  let mapleader = ","
  " nmap <leader>g gg=G
  " nmap <leader>i <c-w>F
  " nmap <leader>t <c-w>gf
  nmap <leader>o :tabe<space>
  nmap <leader>/ :nohlsearch<CR>
  nmap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR>
  nmap <leader>s :call Search()<CR>
  nmap <leader>g :call SearchGithub()<CR>
  map <Leader>d :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------- translate-shell.vim ---------------------------------
  " nnoremap <silent> <leader>t :Translate en:zh-CN<CR>
  " vnoremap <silent> <leader>t :TranslateVisual en:zh-CN<CR>
  nnoremap <silent> <leader>t :Trans<CR>
  vnoremap <silent> <leader>t :TransVisual -brief :zh<CR>
"-------------- vim-tagbar ------------------------------------------
  let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
          \ 'f:functions',
          \ 'functions:functions',
          \ 'c:callbacks',
          \ 'd:delegates',
          \ 'e:exceptions',
          \ 'i:implementations',
          \ 'a:macros',
          \ 'o:operators',
          \ 'm:modules',
          \ 'p:protocols',
          \ 'r:records',
          \ 't:tests'
      \ ]
      \ }
  map <C-m> :TagbarToggle<CR>
"-------------- vim-tabber ------------------------------------------
  map <D-r> :TabberLabel
"-------------- vim-vinegar ------------------------------------------
  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'  "默认不显示隐藏文件
  " let g:netrw_liststyle = 3
  " - 进入目录
  " Esc回到刚才编辑文件
  au FileType netrw nmap <buffer> 0 <C-^>
  " shift+c 切换到文件夹当前目录
  " au FileType netrw nmap <buffer> = :Ntree <CR>
  au FileType netrw nmap <buffer> = <C-^>
  " o 打开文件
  au FileType netrw nmap <buffer> o <Enter>
  " 空格打开文件
  au FileType netrw nmap <buffer> <space> <Enter>
  " 删除文件
  au FileType netrw nmap <buffer> md D
"-------------- ALE -------------------------------------------------
  " ALEInfo 可以查看ale的运行情况，根据该输出，来做相应的处理
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_prettier_use_global = 1
  let g:ale_sign_error = '*'
  let g:ale_sign_warning = '*'
  hi ALEErrorSign   guifg=#FF0000
  hi ALEWarningSign guifg=#FFFF00
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_fix_on_text_changed = 'never'
  let g:ale_linters = {
  \  'javascript': ['eslint'],
  \  'jsx': ['eslint'],
  \  'graphql': ['gqlint'],
  \  'go': ['golint'],
  \}
  let g:ale_fixers = {
  \  'javascript': ['prettier'],
  \  'jsx': ['prettier'],
  \  'json': ['prettier'],
  \  'graphql': ['prettier'],
  \}
"-------------- vim-startify -----------------------------------------
  map <silent><D-e> :Startify <CR>
  let g:startify_bookmarks = [
    \ { 'a': '~/BlockChain/fabric/examples/e2e_cli' },
    \ { 'b': '~/BlockChain/fabric-samples/first-network' },
    \ { 'c': '~/Company/newWorld' },
    \ { 'd': '~/Company/shoukuan-user/user-web' },
    \ { 'z': '~/MyDream/nearby_book_server' },
    \ { 'y': '~/MyDream/newbook' },
    \ { 'v': '~/go/src/work' },
    \ ]
  let g:startify_lists = [
    \ { 'header': ['最新：'],   'type': 'files' },
    \ { 'header': ['会话：'],   'type': 'sessions' },
    \ { 'header': ['书签：'],   'type': 'bookmarks' },
    \ ]
  let g:startify_files_number=7
  let g:startify_padding_left=4
  let g:startify_enable_special=0
  " let g:startify_custom_header=0
  let g:startify_custom_header='map(startify#fortune#boxed(), ''"    ".v:val'')'
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif
"-------------- vim-signify -----------------------------------------
  hi SignifySignAdd           guifg=#00FF00 guibg=NONE
  hi SignifySignDelete        guifg=#FF0000 guibg=NONE
  hi SignifySignChange        guifg=#FFFF00 guibg=NONE
  hi SignifySignChangeDelete  guifg=#FF0000 guibg=NONE
  let g:signify_sign_change = "~"
"-------------- Deoplete --------------------------------------------
  let g:deoplete#enable_at_startup = 1      "默认开启自动补全
  " set splitbelow                          "拆分的窗口放到下面
"--------------deoplete-go ------------------------------------------
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" ------------- deoplete-ternjs -------------------------------------
  let g:deoplete#sources#ternjs#types = 1   "是否展示函数类型
  let g:deoplete#sources#ternjs#docs = 1    "是否展示函数描述
"-------------- SuperTab      ---------------------------------------
  let g:SuperTabDefaultCompletionType = '<C-n>'
  let g:SuperTabClosePreviewOnPopupClose = 1
"--------------- EasyMotion    --------------------------------------
  map <Leader> <Plug>(easymotion-prefix)
  map <Leader>l <Plug>(easymotion-bd-jk)
  "-------------- nerdcommenter ---------------------------------------
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultNesting = 1
  let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }
"-------------- CtrlP -----------------------------------------------
  let g:ctrlp_map = '<D-p>'
  map <Leader>, :CtrlPBuffer<CR>
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
  let g:ctrlp_working_path_mode = 'r'
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
  let g:ctrlp_custom_ignore = '~\|node_modules\|DS_Store\|git'
  "-------------- vim-ripgrep -----------------------------------------
  map <Leader>f :Rg
  let g:rg_highlight = 'true'
  au FileType qf nnoremap <buffer> t <C-W><Enter><C-W>T
  "-------------- AirLine ---------------------------------------------
  let g:airline_theme='murmur'
  let g:airline_powerline_fonts = 1   "这个是安装字体后(https://github.com/powerline/fonts) 必须设置此项
  let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
  let g:airline#extensions#ale#enabled = 1
"-------------- vim-jsx ---------------------------------------------
  let g:jsx_ext_required = 0
"-------------- AddHeader -------------------------------------------
  let g:header_field_author = 'Mantak'
  let g:header_field_author_email = 'mantak@foxmail.com'
  let g:header_field_timestamp_format = '%Y-%m-%d'
  let g:header_auto_add_header = 0
  map <Leader>m :AddHeader<CR>
"-------------- VimAutoformat ---------------------------------------
  au BufWrite *.ex,*.exs,*.go :Autoformat
"-------------- vim-go ----------------------------------------------
  let g:go_auto_sameids = 1             "自动高亮当前光标下的变量
  au Filetype go setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
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
" 删除书签，移动到书签上，shift+d 即可
" 标签
" ,cc 注释 ,cu 取消注释
" hi NonText    guifg=#272822 guibg=#272822 "文件末尾
" hi Folded     guifg=#75715E guibg=#1D1E17 "折叠高亮
" hi LineNr     guifg=#75715E guibg=#272822 "行首数字
" hi SignColumn guifg=#808080 guibg=#272822 "左侧提示
" SSave 保存当前会话
" SDelete 删除会话
" netrw 中，
"   I打开帮助，
"   %新建文件并进入buffer，保存即可，
"   d新建目录，
"   D删除，
"   R重命名，
"   a切换显示内容为隐藏与否
" ]] takes you to the next function or method
" [[ takes you to the previous function or method
" ctrl ]  <=> ctrl t  函数与函数定义之间跳转
" 函数上按K， 打开doc
" Use the clipboard of Mac OS

if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
end

