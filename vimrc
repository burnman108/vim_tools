" Initialize plugin system
call plug#begin('~/.vim/plugged')
" A tree explorer plugin for vim. https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
" lean & mean status/tabline for vim that's light as air. https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" An asynchronous fuzzy finder which is used to quickly locate files, buffers,
" mrus, tags, etc. in large project. https://github.com/Yggdroot/LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" A code-completion engine for Vim. (need macvim) https://github.com/ycm-core/YouCompleteMe
" Plug 'ycm-core/YouCompleteMe'
" A Vim plugin that manages your tag files. https://github.com/ludovicchabant/vim-gutentags
" Insert or delete brackets, parens, quotes in pair.  https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" A calendar application for Vim  https://github.com/itchyny/calendar.vim
Plug 'itchyny/calendar.vim'
" Instant Markdown previews from VIm!  https://github.com/suan/vim-instant-markdown
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()

" PlugInstall       Install plugins
" PlugUpdate        Install or update plugins
" PlugClean         Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade       Upgrade vim-plug itself
" PlugStatus        Check the status of plugins
" PlugDiff          Examine changes from the previous update and the pending changes
" PlugSnapshot      Generate script for restoring the current snapshot of the plugins


" vim的基础知识链接：https://github.com/wsdjeg/vim-galore-zh_cn#%E5%A4%87%E4%BB%BD%E6%96%87%E4%BB%B6
" 我参考的vim配置文档：https://github.com/axiaoxin/my-vimrc/blob/vim-8/.vimrc
"""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""
" 设置编码为 utf-8
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936

" 解决 console 输出乱码
language messages zh_CN.utf-8

" 取消备份文件
set nobackup

" 取消交换文件，我觉得带上挺好的，反正会自动删除
" set noswapfile

" 状态栏配置，总是显示状态行
set laststatus=2

" 打开语法高亮
syntax enable

" 针对所有缓冲区中的文件启用语法高亮度
syntax on

" vimrc 文件修改之后自动加载
autocmd! bufwritepost .vimrc source %

" 文件修改之后自动载入
set autoread

" 高亮搜索命中的文本
set hlsearch

" 随着键入即时搜索
set incsearch

" 搜索时忽略大小写
set ignorecase

" 有一个或以上大写字母时仍大小写敏感，如果「smartcase」和「ignorecase」都被開啟，此時搜尋「the」，則「THE」、「tHE」、「The」...等子字串都算是符合搜尋條件；但搜尋「The」，則只有「The」符合搜尋條件。
set smartcase

set guifont=Menlo:h14

" 在状态栏显示正在输入的命令
set showcmd

" 显示括号配对情况
set showmatch

" :next, :make 命令之前自动保存
set autowrite

" 允许使用鼠标
set mouse=a

" 用y直接把内容复制到系统剪贴板
set clipboard=unnamed


" 设置行号
set nu

" 根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set smarttab

" 在这种缩进形式中，新增加的行和前一行使用相同的缩进形式
set autoindent

" 在这种缩进模式中，每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出花括号，当遇到右花括号（}），则取消缩进形式。
set smartindent

" 保存文件时自动删除行尾空格或 Tab
autocmd BufWritePre * :%s/\s\+$//e

" 保存文件时自动删除末尾空行
autocmd BufWritePre * :%s/^$\n\+\%$//ge

" 填充 Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" 代码折叠 用 za 命令折叠或展开
set foldmethod=indent
" 默认展开
set nofoldenable
" 有6种方法来选定折叠：
" 1    manual           使用 zf、zF 或 :fold 来自定义折叠
" 2    indent           基于缩进折叠
" 3    expr             使用 'foldexpr' 来创建新的折叠逻辑
" 4    syntax           根据语法折叠，比如折叠 if 代码块
" 5    diff             在「比较窗口」中折叠未改变的文本
" 6    marker           根据特定的文本标记折叠（通常用于代码注释）

" 突出显示当前行，列
set cursorline

" 设置 退出 vim 后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=

" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" 退出 vim 后，仍然可以 undo 上次编辑
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""
" 关闭buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" F2 切换行号显示
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F4 打开目录树
nmap <silent> <F4> :NERDTreeToggle<CR>

" F5 新建tab页
map <F5> <Esc>:tabnew<CR>

" F6 呼出日历
map <F6> :Calendar<cr>

" <F10> 中文中夹杂的英文和数字添加空格(注意\\| " 在 map 里面需要转义，直接执行使用\|)
nnoremap <F10> :%s/[^\x00-\xff]\zs\ze\w\\|\w\zs\ze[^\x00-\xff]/ /g<CR>

" 给当前单词添加引号
nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" 映射切换 buffer 的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 映射切换 tab 的键位
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" 在 Normal Mode 和 Visual/Select Mode 下，利用 > 键和 < 键来缩进文本
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" quicker window switching
nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"
"
" 滚动屏幕
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" VIM 窗口操作命令：
"
" 左右分割窗口 Ctrl+w +v
" 上下分割窗口 Ctrl+w +s
"
" 关闭窗口 Ctrl+w  +q
"
" 光标在所有窗口间按顺序移动 Ctrl+w +w
" 光标移动到左边窗口 Ctrl+w +h
" 光标移动到下面窗口 Ctrl+w +j
" 光标移动到上面窗口 Ctrl+w +k
" 光标移动到右面窗口 Ctrl+w +l
" 光标移动到最左上角的窗口 Ctrl+w +t
" 光标移动到最右下角的窗口 Ctrl+w +b
" 光标移动到上一次访问的窗口 Ctrl+w +p
"
" 交换窗口位置 Ctrl+w +r     Ctrl+w +R     Ctrl+w +x
"
" 交换窗口位置并还原大小 Ctrl+w +H    Ctrl+w +J    Ctrl+w +K    Ctrl+w +L
"
" 将所有窗口调整到相同大小 Ctrl+w +=
" 将当前窗口最大化 Ctrl+w +|
" 将当前窗口覆盖全部只剩一个窗口 Ctrl+w +T
"

""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""

" NERDTREE
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
autocmd vimenter * NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 当nerdtree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 鼠标模式:目录单击,文件双击
" let NERDTreeMouseMode=2
" 显示文件
let NERDTreeShowFiles=1
" 高亮显示当前文件或目录
let NERDTreeHightCursorline=1
" 显示隐藏文件
" let NERDTreeShowHidden=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 进入vim后光标在右侧文件编辑区
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w

" airline
let g:airline_theme="molokai"

" 这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 关闭空白符检测
let g:airline#extensions#whitespace#enabled=0

set t_Co=256
set lazyredraw

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_detect_modified=1
let g:airline_detect_paste=1


" LeaderF
" 文件搜索
nnoremap <silent> <Leader>f :Leaderf file<CR>

" 历史打开过的文件
nnoremap <silent> <Leader>m :Leaderf mru<CR>

" Buffer
nnoremap <silent> <Leader>b :Leaderf buffer<CR>

" 函数搜索（仅当前文件里）
nnoremap <silent> <Leader>F :Leaderf function<CR>

" 模糊搜索，很强大的功能，迅速秒搜
nnoremap <silent> <Leader>rg :Leaderf rg<CR>

let g:Lf_ShowDevIcons = 0
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_IndexTimeLimit = 1200
let g:Lf_MruWildIgnore = {
            \ 'dir': ['.git'],
            \ 'file': []
            \ }
let g:Lf_RgConfig = [
            \ "--max-columns=150",
            \ "--glob=!node_modules/*",
            \ "--glob=!dist/*",
            \ ]
