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
  Plug 'scrooloose/nerdtree'
  Plug 'Mantak/vim-tabber'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "--- 功能增强 -----------------------------------------------------
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
  " Plug 'morhetz/gruvbox'
  " Plug 'NLKNguyen/papercolor-theme'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'sickill/vim-monokai'
  Plug 'joshdick/onedark.vim'
  "--- 语言支持 -----------------------------------------------------
  Plug 'godlygeek/tabular'                            "markdown需要
  Plug 'plasticboy/vim-markdown'                      "markdown
  Plug 'pangloss/vim-javascript'                      "Javascript
  Plug 'mxw/vim-jsx'                                  "React
  Plug 'elixir-editors/vim-elixir'                    "Elixir缩进
  Plug 'slashmili/alchemist.vim'                      "Elixir提示
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  "Go
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
  "--- 语法检查 -----------------------------------------------------
  Plug 'w0rp/ale', { 'do': 'npm install -g eslint babel-eslint eslint-plugin-react' }   "JS和Go都可以检查
  "--- 代码格式化 ---------------------------------------------------
  Plug 'Chiel92/vim-autoformat'        "其他语言的自动格式
  Plug 'prettier/vim-prettier', { 'do': 'npm install -g prettier' } "js css的自动格式化
call plug#end()
"---------------输入法设置-------------------------------------------
  set noimdisable   "普通模式下, 只有英文可用
  set iminsert=0    "输入模式下, 0 :lmap is off and IM is off
  set imsearch=0    "搜索模式下, 0 :lmap is off and IM is off
"---------------界面设置---------------------------------------------
  " set guioptions-=T    "不显示工具栏  macvim本身也没有这个东西
  " set guioptions-=m    "去掉菜单  macvim本身也没这个东西
  " set cmdheight=1      "设定命令行的行数为 1
  " set laststatus=2     "显示状态栏 (默认值为 1, 无法显示状态栏)
  " set ruler            "打开状态栏标尺
  " set guioptions-=r    "把gui右边的滑动条去掉
  " set showtabline=2    "默认显示tab页
  set guioptions=      "去掉左右的滑动条和tab页的默认渲染
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
  set mouse=a "可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
  set foldenable "开始折叠
  set foldmethod=indent "设置缩进折叠
  set foldlevel=1 "超过1层，才会缩进
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
  autocmd BufWritePre * silent! :%s/\s\+$//e "保存的时候,自动去掉行尾空格
  autocmd BufWritePre * silent! :retab "保存的时候,自动将tab换成空格
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
  let modDay=(strftime("%d"))%3
  if modDay == 0
    colorscheme onedark
    hi CursorLine guifg=NONE    guibg=#2F333D "当前行
    hi NonText    guifg=#282C34 guibg=#282C34 "文件末尾
  elseif modDay == 1
    colorscheme monokai
    hi CursorLine guifg=NONE    guibg=#3c3d37 "当前行
    hi NonText    guifg=#272822 guibg=#272822 "文件末尾
    hi LineNr     guifg=#75715E guibg=#272822 "行首数字
    hi Folded     guifg=#75715E guibg=#1D1E17 "折叠高亮
    hi SignColumn guifg=#808080 guibg=#272822 "左侧提示
  else
    colorscheme dracula
    hi CursorLine guifg=NONE    guibg=#444759 "当前行
    hi NonText    guifg=#282A36 guibg=#282A36 "文件末尾
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
  nmap <leader>g gg=G
  nmap <leader>i <c-w>F
  nmap <leader>t <c-w>gf
  nmap <leader>o :tabe<space>
  nmap <leader>/ :nohlsearch<CR>
  nmap <leader>8 :set fileencoding=utf-8<CR>:set fileformat=unix<CR>
  nmap <leader>s :call Search()<CR>
  nmap <leader>c :call SearchGithub()<CR>
  map <Leader>d :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------- vim-tabber ------------------------------------------
map <D-r> :TabberLabel
"-------------- ALE -------------------------------------------------
  " ALEInfo 可以查看ale的运行情况，根据该输出，来做相应的处理
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_sign_error = '*'
  let g:ale_sign_warning = '*'
  hi ALEErrorSign   guifg=#FF0000
  hi ALEWarningSign guifg=#FFFF00
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linter_aliases = {'javascript.jsx': 'javascript', 'jsx': 'javascript'}
  "JS只使用eslint检测， html不做检测, Go语言使用默认检测
  let g:ale_linters = { 'javascript': ['eslint'], 'html': [] }
  "-------------- fcitx-vim-osx ---------------------------------------
  " au FocusGained * call Fcitx2en()  "进入vim，自动切换为英文，免去键盘问题
  "-------------- vim-signify -----------------------------------------
  hi SignifySignAdd     guifg=#00FF00 guibg=NONE
  hi SignifySignDelete  guifg=#FF0000 guibg=NONE
  hi SignifySignChange  guifg=#FFFF00 guibg=NONE
"-------------- Deoplete --------------------------------------------
  let g:deoplete#enable_at_startup = 1      "默认开启自动补全
  " set splitbelow                          "拆分的窗口放到下面
" ------------- deoplete-ternjs -------------------------------------
  let g:deoplete#sources#ternjs#types = 1   "是否展示函数类型
  let g:deoplete#sources#ternjs#docs = 1    "是否展示函数描述
"-------------- SuperTab      ---------------------------------------
  let g:SuperTabDefaultCompletionType = '<C-n>'
  let g:SuperTabClosePreviewOnPopupClose = 1
""-------------- EasyMotion    --------------------------------------
  map <Leader>, <Plug>(easymotion-bd-jk)
  map <Leader> <Plug>(easymotion-prefix)
"-------------- NerdTree --------------------------------------------
  " let NERDTreeMapActivateNode='<space>'  "使用空格打开文件
  autocmd StdinReadPre * let s:std_in=1  "Open NERDTree if no files specified
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " let NERDTreeWinPos=1 "窗口居右
  " set completeopt=menu  "不要打开提示框
  let NERDTreeShowBookmarks=1 "显示书签
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
  "-------------- nerdcommenter ---------------------------------------
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultNesting = 1
  let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }
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
  map <Leader>f :Rg
  let g:rg_highlight = 'true'
  "-------------- AirLine ---------------------------------------------
  let g:airline_theme='murmur'
  let g:airline_powerline_fonts = 1   "这个是安装字体后(https://github.com/powerline/fonts) 必须设置此项
  let g:airline#extensions#tabline#enabled = 0  "不使用airline的tab页
  let g:airline#extensions#ale#enabled = 1
"-------------- vim-jsx ---------------------------------------------
  let g:jsx_ext_required = 0
"-------------- AddHeader -------------------------------------------
  let g:header_field_author = 'Mantak'
  let g:header_field_author_email = 'mantak@hotmail.com'
  let g:header_field_timestamp_format = '%Y-%m-%d'
  let g:header_auto_add_header = 0
  map <Leader>a :AddHeader<CR>
  "  "-------------- VimPrettier --------------------------------------
  let g:prettier#autoformat = 1
  let g:prettier#exec_cmd_async = 1
  let g:prettier#config#print_width = 100
  let g:prettier#config#single_quote = 'true'
  let g:prettier#config#arrow_parens = 'always'
  let g:prettier#config#bracket_spacing = 'true'
  let g:prettier#config#parser = 'babylon'
  autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
"-------------- VimAutoformat ---------------------------------------
  au BufWrite *.ex,*.exs,*.go :Autoformat
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
" 在nerdTree上，移动到文件夹上 :Bookmark 名字 即可添加书签
" 删除书签，移动到书签上，shift+d 即可
" 标签
" ,cc 注释 ,cu 取消注释
