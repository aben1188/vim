" 以下为Vim插件管理工具Vundle的设置(要求放在vimrc的最前面)
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=$VIM/vimfiles/bundle/Vundle.vim  |" Vundle.vim为文件夹
" 插件的安装路径(若不指定vundle#begin()中的路径，默认为C:\users\***\.vim)
call vundle#begin('$VIM/vimfiles/bundle')
"set runtimepath+=$HOME/vimfiles/bundle/Vundle.vim/
"call vundle#begin('$HOME/vimfiles/bundle/')
"call vundle#begin()
"call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" 注：要删除一个由Vundle管理的插件，需要先删除或注释掉“Plugin '插件名'”，然
" 后再执行:PluginClean命令，才会将不再由Vundle管理的插件删除，否则无法删除
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 以上为Vim插件管理工具Vundle的设置


"**************************************************************
"set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt='-a --binary '
  if &diffopt =~ 'icase' | let opt=opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt=opt . '-b ' | endif
  let arg1=v:fname_in
  if arg1 =~ ' ' | let arg1='"' . arg1 . '"' | endif
  let arg2=v:fname_new
  if arg2 =~ ' ' | let arg2='"' . arg2 . '"' | endif
  let arg3=v:fname_out
  if arg3 =~ ' ' | let arg3='"' . arg3 . '"' | endif
  let eq=''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd='""' . $VIMRUNTIME . '\diff"'
      let eq='"'
    else
      let cmd=substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd=$VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"**************************************************************
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=$vim/vim74/plugin

" Sets how many lines of history VIM has to remember
set history=200

" Enable filetype plugins
" filetype命令：Vim会检测要编辑的文件类型。这是通过检查文件名完成的，
" 有时候也检查文本里是否包含特定的文本。每次一个新的或者已经存在的
" 文件被编辑时，Vim会试图识别文件的类型，并设置filetype选项。同时，
" 也触发FileType事件。该事件可以设置语法高亮、特定选项等等。
"filetype plugin on
"filetype indent on

" 文件在Vim外被改动时自动重新读入；但文件在外部被删除则不重新读入
set autoread

" With a map leader it's possible to do extra key combinations
" like <LEADER>w saves the current file
let mapleader="\<space>"

" 设置窗口启动位置：x轴 y轴【左上角为：x=0 y=0】
winpos 930 675
" 设置窗口大小：行和列
"let windowlines=25
"let windowcolumns=86
"set lines=25
"set comlumns=86
"set lines=&windowlines columns=&windowcolumns 
set lines=25 columns=86 

" 光标上下移动时，屏幕上保留的最少屏幕行数
set scrolloff=2

" 增强模式命令行补全，按下wildchar(默认<Tab>)启动补全
set wildmenu

" Height of the command bar
"set cmdheight=2
" 命令行窗口高度(屏幕行数)
set cmdwinheight=20

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=1

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set timeoutlen=800

" 高亮显示光标所在行
set cursorline
" 高亮显示光标所在列【简写：设置 cuc；取消 nocuc】
"set cursorcolumn
 
" Default Colors for CursorLine
"highlight CursorLineNr guifg=red

" 这一行跟某未知脚本有冲突，放到
" colorshceme文件(desert.vim)中才解决
"highlight LineNr guifg=Brown

" Change Color when entering Insert Mode
" au[tocmd] [group] {event} {pat} [nested] {cmd}：把{cmd}加到Vim在匹配{pat}
" 模式的文件执行{event}事件时自动执行的命令列表中。Vim总把{cmd}加到已有的
" 自动命令之后，这样保证自动命令的执行顺序与其定义的顺序相同。
autocmd InsertEnter * highlight LineNr guifg=Red
autocmd InsertEnter * set cursorcolumn
autocmd InsertEnter * highlight statusline guifg=Red

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight LineNr guifg=#909194
autocmd InsertLeave * set nocursorcolumn
autocmd InsertLeave * highlight statusline guifg=NONE

" 设置光标不闪烁
set gcr=a:block-blinkon0

" 添加行号
set number
" 添加相对行号
set relativenumber

" 下列移动命令移动光标时，不回到行首第一个非空白字符,
" 而是尽量保持在同一列上(如果可能的话)：
" C-B、C-F、C-D、C-U、G、H、M、L、gg、d、<<、>>、带计数的%、
" 缓冲区改变命令(CTRL-^、:bnext、:bNext等)、:25、:+、:-等
set nostartofline

"" 设置默认编码 
"set encoding=utf-8 
"set fileencodings=utf-8,chinese,latin-1 
"if has("win32") 
"    set fileencoding=chinese 
"else 
"    set fileencoding=utf-8 
"endif 
"
"" 解决菜单乱码 
"source $VIMRUNTIME/delmenu.vim 
"source $VIMRUNTIME/menu.vim 
"
"" 解决console输出乱码 
"language messages zh_CN.utf-8 

" 配置多语言环境，解决中文乱码问题
if has("multi_byte")
    " Vim内部使用的编码 
    set encoding=utf-8
    " Windows下的gVim其键盘输入和屏幕显示均不依赖termencoding
    "set termencoding=utf-8
    " 自动排版时的格式选项
    set formatoptions+=mM
    " 读文件时Vim自动侦测文件编码方式的编码列表项，
    " prc(等同于chinese)即Windows下的cp936、Unix下的euc-cn
    set fileencodings=ucs-bom,utf-8,prc,gb18030,taiwan,japan,korea,latin1
    " 处理CJK东亚二义性宽度字符类 (East Asian Width Class Ambiguous)
    " 例如，欧元符号、注册记号、版权记号、希腊字母、西里尔字母等等
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        " 解决菜单乱码 
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        " 解决console输出乱码 
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" 改配色，默认的白色太过刺眼 
"colorscheme desert 
"colorscheme morning
"colorscheme evening
colorscheme dracula
" 打开语法高亮功能(dracula颜色方案需要打开)
" syntax on会覆盖已有的颜色，而syntax enable会保持当前已有的色彩设置，
" 只设置没有设置过的组；这样不管在使用此命令的前后，都可设置自己喜欢的颜色。
syntax on
"syntax enable

" 可视模式下选择文本时即使不进行复制、删除等操作，
" 也自动将选择文本保存到"*寄存器(系统剪贴板，
" windows系统中，与"+寄存器等同)，因此可少一个步骤
"set guioptions+=a
" 指定Vim窗口顶部每个标签页标签的内容 
set guitablabel=%M\ %t

" 使"*寄存器(系统剪贴板寄存器)等效于""无名寄存器(Vim默认寄存器)，
" 以便与Windows共用剪贴板；不过，在实际使用过程中发现，
" Vim中的删除操作可直接粘贴于其他程序，复制操作却不行；
" 而其他程序中的复制、删除操作，则均可在Vim中直接粘贴。
set clipboard=unnamed

" 快捷键映射 {
    " facilitate screen move
    " 滚动整屏
    "nnoremap <S-CR> :let b:curPos=getpos(".")<CR> <C-F> :call setpos(".", b:curPos)<CR> :unlet b:curPos<CR>
    "nnoremap <S-CR> <C-F>zz
    nnoremap <S-CR> <C-D><C-D>
    "nnoremap <S-BS> :let b:curPos=getpos(".")<CR> <C-B> :call setpos(".", b:curPos)<CR> :unlet b:curPos<CR>
    "nnoremap <S-BS> <C-B>zz
    nnoremap <S-BS> <C-U><C-U>
    " 滚动半屏
    nnoremap <C-CR> <C-D>
    nnoremap <C-BS> <C-U>
    nnoremap <C-J>  <C-D>
    nnoremap <C-K>  <C-U>
    "nnoremap <SPACE><SPACE> <C-D>
    "nnoremap <S-SPACE><SPACE> <C-U>
    " 滚动一行
    nnoremap <C-S-CR> <C-E>gj
    nnoremap <C-S-BS> <C-Y>gk
    "nnoremap <DOWN>  <C-E>
    "nnoremap <UP>    <C-Y>

    " Treat long lines as break lines（按显示行逐行移动，而非按文本行）， 
    " 并且设定为文本逐行滚动，而非光标逐行移动（光标相对屏幕的位置
    " 固定不动，按F3可切换这两种方式）
    noremap j <C-E>gj
    noremap k <C-Y>gk

    " go to older jump position(contrast with Tab or C-I)
    noremap <S-TAB> <C-O>
    
    " 命令模式下，移动到当前行行首、行尾、行中
    nnoremap <C-H> ^
    nnoremap <C-L> $
    noremap 0      ^
    noremap -      :call cursor(line("."), col("$")/2)<CR>
    noremap=     $

    " 将命令行前导符由冒号:改为分号;
    "nnoremap ; :

    " 插入模式、命令行模式下移动、删除
    inoremap <C-H> <LEFT>
    inoremap <C-J> <Down>
    inoremap <C-K> <UP>
    inoremap <C-L> <RIGHT>
    inoremap <C-D> <DELETE>
    cnoremap <C-H> <LEFT>
    cnoremap <C-L> <RIGHT>
    cnoremap <C-D> <DELETE>

    " 插入模式下，回车为ESC；Shift+回车为回车
    "inoremap <S-CR> <CR>
    "inoremap <CR> <ESC>
    " i、v、c模式下，jj或C-N返回正常模式
    inoremap jj    <ESC>
    inoremap <C-N> <ESC>
    vnoremap <C-N> <ESC>
    cnoremap <C-N> <ESC>
    
    " 插入模式下，复制上、下行对应列字符
    inoremap <C-BS> <C-Y>
    inoremap <C-CR> <C-E>

    " 切换标签页，与Windows中标签页切换的常规操作相同
    nnoremap <C-TAB>   gt
    nnoremap <C-S-TAB> gT

    " 分屏操作(多窗口操作)
    " 由于VimScript中的注释以一个双引号开始，有时容易与
    " 双引号字符串中的双引号混淆(有些命令后不能跟注释，因为
    " 字符串优先于注释)，因此，可在命令行后面的注释前加上
    " 命令分隔符|(用于分隔放在单行上的多条Ex命令语句)，以免出错
    nnoremap ,c <C-W>c  |" 关闭窗口
    nnoremap ,s <C-W>s  |" 水平分割窗口
    nnoremap ,v <C-W>v  |" 垂直分割窗口
    nnoremap ,h <C-W>h  |" 将光标移到左边窗口
    nnoremap ,j <C-W>j  |" 将光标移到下边窗口
    nnoremap ,k <C-W>k  |" 将光标移到上边窗口
    nnoremap ,l <C-W>l  |" 将光标移到右边窗口
    nnoremap ,w <C-W>w  |" 将光标移到下一个窗口
    nnoremap ,H <C-W>H  |" 将当前窗口移到左边 
    nnoremap ,J <C-W>J  |" 将当前窗口移到上边
    nnoremap ,K <C-W>K  |" 将当前窗口移到下边
    nnoremap ,L <C-W>L  |" 将当前窗口移到右边
    nnoremap ,= <C-W>=  |" 使所有分窗口一样高
    nnoremap ,+ <C-W>+  |" 增加当前窗口的高度
    nnoremap ,- <C-W>-  |" 减少当前窗口的高度
    nnoremap ,> <C-W>>  |" 增加当前窗口的宽度
    nnoremap ,< <C-W><  |" 减少当前窗口的宽度
    nnoremap ,T <C-W>T  |" 将所有分窗口转换标签

    " 将Y映射为从光标当前位置复制到行尾，
    " 以与D、C等大写字母的行为统一起来；
    " 并且将复制内容回显到命令行中。
    " 其中，echom[sg] {expr1}：回显表达式的结果，将其作为一个
    " 真正的消息，并把该消息保存在message-history里；和echo类似，
    " 但不可显示的字符只回显而不会被解释；@0，在命令行模式和
    " Ex模式中，@表示寄存器，不同于普通模式中以"表示寄存器
    noremap Y y$ :echom "Copied Text: " . @0<CR>3h
    nnoremap yy yy :echom "Copied Text: " . @0<CR>3h  
    vnoremap y y :echom "Copied Text: " . @0<CR>h
" }

" Disable highlight when <LEADER><cr> is pressed
map <LEADER>h :noh<CR>

" 普通模式下插入换行符
map <LEADER><CR> i<CR><ESC>

" 打开配置文件
map <LEADER>ev :edit $MYVIMRC<CR>
" 重载配置文件
map <LEADER>es :source $MYVIMRC<CR>

" 保存文件并退出
map <LEADER>w :wq<CR>
" 保存文件,不退出
map <LEADER>s :update<CR>
" 文件没有修改则直接退出
map <LEADER>q :q<CR>
" 文件没有修改则全部退出
map <LEADER>x :qa<CR>

" 普通模式下插入一个空行
nmap <LEADER>o o<ESC>
nmap <LEADER>O O<ESC>

" 撤销上一次命令行set操作
map <LEADER>u :call UndoSetCommand()<CR>
" 重复上一次命令行操作
map <LEADER>r :@:<CR>

" 普通模式下插入单个字符
nmap <LEADER>i i <ESC>r
nmap <LEADER>a a <ESC>r

" 进入可视模式块选操作(列选操作)子模式
nnoremap <LEADER>v <C-V>
" 可视模式v/V子模式下，仍可切换到块选子模式
vnoremap <LEADER>v <C-V>

" n、v、o模式下粘贴"0复制专用寄存器中的内容
noremap <LEADER>p "0p
noremap <LEADER>P "0P

" 缓冲区切换
map <LEADER>bp :bprevious<CR>
map <LEADER>bn :bnext<CR>

" Useful mappings for managing tabs
map <LEADER>tn :tabnew<CR>
map <LEADER>ts :tab split<CR>
map <LEADER>to :tabonly<CR>
map <LEADER>tc :tabclose<CR>
map <LEADER>tf :tabfirst<CR>
map <LEADER>tl :tablast<CR>
map <LEADER>tm :tabmove
map <LEADER>tp :tabprevious<CR>
map <LEADER>tx :tabnext<CR>
" Let 'tt' toggle between this and the last accessed tab
let g:lasttab=1
nmap <LEADER>tt :execute "tabnext ".g:lasttab<CR>
au TabLeave * let g:lasttab=tabpagenr()
" 列出所有标签页
map <LEADER>ta :tabs<CR>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <LEADER>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <LEADER>cd :cd %:p:h<cr>:pwd<cr>

" 在临时将当前窗口放大到一个新标签以及关闭该新标签返回原窗口之间切换
map <LEADER>z :call ZoomWindowTemporarily()<CR>

" Specify the behavior when switching between buffers 
" try和endtry：改变try和endtry之间命令的错误处理，包括所有
" 执行的内容、source里的命令、函数调用、自动命令的激活等。
" cat[ch] /{pattern}/：匹配{pattern}的例外抛出时，如果它没有被前一个
" catch捕获，则执行本语句之后的命令，直到遇到和本catch处于同一try块的
" 下一个catch、finally或者endtry为止。否则，这些命令被跳过。
" 若没有提供{pattern}，所有的错误都会被捕获。
try
" 控制缓冲区切换的行为；
" useopen，跳到第一个打开的包含指定缓冲区的窗口(如果有的话)；
" usetab，类似于useopen，但也考虑其它标签页里的窗口；
" split，在载入用于在quickfix命令里显示错误的缓冲区之前分割当前窗口；
" newtab，类似于split，但打开新标签页，若和split同时存在，本值优先。
  set switchbuf=useopen,usetab,newtab
  " 默认值为1，即多于一个标签页才显示标签栏
  "set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" viminfo中的%参数：保存和恢复缓冲区列表；Vim启动时若有文件名参数，
" 缓冲区列表不予恢复，若没有文件名参数，缓冲区列表从viminfo文件里恢复；
" 没有文件名的和帮助文件的缓冲区不会写入viminfo文件；若后跟数值，
" 该数值指定保存的缓冲区的最大个数，若没跟数值，则保存所有的缓冲区。
" se[t] {option}^={value}：把{value}乘到数值选项里，或者附加到字符串
" 选项之前。如果选项是逗号分隔的列表，除非原来的值为空，会加上一个逗号。
set viminfo^=%

" 绝对行号、相对行号、无行号切换
" com[mand][!] [{attr}...] {cmd} {rep}：定义一个用户命令。命令的名字是
" {cmd}，而替换的文本是{rep}。该命令的属性(参考手册)是{attr}。如果该
" 命令已存在，报错，除非指定!，这种情况下命令被重定义。
command! Tln call s:ToggleLineNumber()
nnoremap <F2> :Tln<CR>

" 切换滚动模式：文本逐行滚动(光标不动)、光标逐行移动
command! Tsm call ToggleScrollMode()
nnoremap <F3> :call ToggleScrollMode()<CR>

"Toggle Menu and Toolbar 切换有无菜单栏、工具栏和滚动条
set guioptions-=m  |" m，菜单栏
set guioptions-=T  |" T，工具栏
set guioptions-=r  |" r，右边滚动条
set guioptions-=L  |" L，垂直分割窗口时左边滚动条
" =~#，匹配大小写，即使已设置了ignorecase
" <Bar>，即Ex命令分隔符|；\为续行符(长行接续符)
map <F4> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
        \set guioptions-=r <bar>
        \set guioptions-=L <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=r <bar>
        \set guioptions+=L <bar>
    \endif<CR>

" 一键切换窗口最大化、还原窗口大小
map <F11> :call ToggleWindowSize()<CR>

" %默认匹配()、[]、{}，增加匹配<>
set matchpairs+=<:>

" 普通模式下当前缓冲区文本修改、退出插入模式、离开缓冲区、失去焦点时，自动保存文件
autocmd TextChanged,InsertLeave * update
autocmd BufLeave,FocusLost * wall

"" 自动保存配置(自动保存、读取、执行session会话文件)
"cd $vim/vim74   "进入保存session会话文件的目录
"" sesstionoptions：改变mksession命令的效果。这是逗号分隔的单词列表，
"" 每个单词允许保存和恢复某种设置：curdir，当前目录；sesdir，将session
"" 会话文件所在的目录切换成当前目录
""set sessionoptions-=resize
""set sessionoptions+=sesdir 
"set sessionoptions+=winpos,globals
"" mks[ession][!] [file]：写入一个Vim脚本，该脚本能够恢复当前的编辑会话；
"" 如果包含[!]，已有的文件会被覆盖。若不提供[file]，默认保存为"session.vim"。
"" 注意：若提供[file]，不能加.vim扩展名后缀，否则出错(vim会自动加)
"autocmd VimLeave * mksession!
"autocmd VimEnter * :call s:ReadSession()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

" Persistent undo 文件关闭后再打开仍可撤销、恢复上次的编辑操作
"set undodir=~/.vim/undodir
set undofile
" maximum number of changes that can be undone
"set undolevels=1000  " 此为默认设置，所以注销 
" maximum number lines to save for undo on a buffer reload
"set undoreload=10000 " 此为默认设置，所以注销 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" 插入模式中插入<Tab>时使用合适数量的空格，要插入实际的制表用CTRL-V<Tab>
set expandtab

" Be smart when using tabs ;)
" 行首的<Tab>根据shiftwidth插入空白，tabstop或softtabstop用在别的地方，
" <BS>删除行首shiftwidth那么多的空白；该选项若关闭，<Tab>总是根据tabstop
" 或softtabstop决定插入空白的数目，shiftwidth只用于文本左移或右移。
" 插入空白的具体方式 (制表还是空格) 取决于expandtab选项。
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
" Auto indent
set ai
" Smart indent
set si
" Wrap lines
"set wrap  " 此为默认设置，所以注销 

""""""""""""""""""""""""""""""
" 输入法设置 
""""""""""""""""""""""""""""""
" 普通模式下自动禁用中文，但可接受中文标点
set noimdisable
" 设置输入法的激活键
set imactivatekey=C-space

""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"noremap * :call VisualSelectionArthurChiao('SearchForward', '')<CR>
"noremap # :call VisualSelectionArthurChiao('SearchBackward', '')<CR>
" 
"vnoremap * :<C-U>call VisualSelectionAmix('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap # :<C-U>call VisualSelectionAmix('', '')<CR>?<C-R>=@/<CR><CR>
"vnoremap * :<C-U>call VisualSelectionAmix('', '')<CR>/<C-R>/<CR>
"vnoremap # :<C-U>call VisualSelectionAmix('', '')<CR>?<C-R>/<CR>
vnoremap <LEADER>f :call VisualSelectionAmix('', '')<CR>/<C-R>/<CR>
vnoremap <LEADER>b :call VisualSelectionAmix('', '')<CR>?<C-R>/<CR>

""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""
" Always show the status line, even for one window
set laststatus=2
" Show line number, column number, and relative position
" within a file in the status line
"set ruler
" Format the status line
"set statusline=\%{HasPaste()}%F%m%r%h\ %w\ \CWD:\ %r%{getcwd()}%h\ \L%l\/\C%c
" 状态栏设置：%<，行过长，则开头截短；CFP，当前文件路径，%F，显示完整路径；
" %m，修改标志位；%r，只读标志位；%h，帮助标志位；%w，预览窗口标志位；
" FMT，文件格式，%{&fileformat}，%{}表示计算表达式，&表示取得选项变量的值；
" TYPE，文件类型，%Y，文件类型；%b，光标所在字符的10进制码点值，.9，最大显示9位；
" %B，光标所在字符的16进制码点值；CWD，当前工作目录；%=，左对齐与右对齐的分界点；
" %c，列号；%V，虚拟列号，表示为负数；%p，当前行在文件位置的百分比；
" %P，窗口在文件位置的百分比；%%，显示%号本身；%L，文件缓冲区里的总行数。
"set statusline=%<[CFP=%F]%m%r%h%w\ [FMT=%{&fileformat}]\ [TYPE=%Y]\ [%.9b\ 0x%.9B]\ [CWD=%{getcwd()}]\ %=[%l,%c%V\ %p%%\ %P\ %LLs]
"let g:airline_section_b='%<[CFP=%F]%m%r%h%w\ [FMT=%{&fileformat}]\ [TYPE=%Y]\ [%.9b\ 0x%.9B]\ [CWD=%{getcwd()}]'
"let g:airline_section_y='[%l,%c%V\ %p%%\ %P\ %LLs]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置airline（代替statusline，powerline的纯vim实现，无需Python支持）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置vim-airline的主题为luna
"let g:airline_theme="luna" 

" 安装字体后，必须设置此项 
let g:airline_powerline_fonts=1   

" 打开tabline功能，方便查看Buffer和切换，这个功能比较不错，
" 在1个Tab下可用多个buffer，省去安装minibufexpl插件了
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#symbol='!'

" Windows系统还需要在上面设置下增加如下代码
" 设置consolas字体"
set guifont=Consolas\ for\ Powerline\ FixedD:h11

" 设置状态栏符号显示，下面编码用双引号
let g:Powerline_symbols="fancy"
let g:airline_symbols={}
let g:airline_left_sep="\u2b80" 
let g:airline_left_alt_sep="\u2b81"
let g:airline_right_sep="\u2b82"
let g:airline_right_alt_sep="\u2b83"
let g:airline_symbols.branch="\u2b60"
let g:airline_symbols.readonly="\u2b64"
let g:airline_symbols.linenr="\u2b61"

" 设置顶部tabline栏符号显示
let g:airline#extensions#tabline#left_sep="\u2b80"
let g:airline#extensions#tabline#left_alt_sep="\u2b81"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配置airline结束
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VimEnter事件(做完所有启动任务，包括载入.vimrc文件、执行"-c cmd"参数、
" 创建所有窗口并在其中载入所有缓冲区)之后，最大化窗口。
" simalt命令告诉Vim(winaltkeys不要设置为yes)虚拟一个Windows风格的Alt按键行为，
" 这样可以用它来映射Alt组合键(或者任何其它键)来产生标准的Windows操作，以便于
" 在Windows中即使禁用Alt-{key}访问菜单的标准方法(winaltkeys设置为no)，
" 也能通过simalt来模拟访问菜单；其中，~在simalt命令中代表空格<Space>。
autocmd VimEnter * simalt ~x
let s:window_max_status=1


"***************************************************************
""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""
" 撤销刚刚执行的set设置命令
" fu[nction][!] {name}([arguments]) [range] [abort] [dict]：
" 定义{name}命名的新函数。名字必须由字母数字和 ’_’ 字
" 符组成，而且必须以大写字母或者"s:"开头。
" 若有同名函数且没有使用[!]，给出错误信息；若给出[!]，已有的函数
" 被悄然替代，但该函数正在执行期间除外。此时，这是一个错误。
" 如果给出[range]参数，则该函数自己能理解并处理行范围。该范围通过
" a:firstline和a:lastline定义。如果没有[range]，:{range}call
" 会在该范围的每一行分别执行该函数，每次光标都定位在处理行的行首。
" 见|function-range-example|。
function! UndoSetCommand()
    if (@: =~? '^set\s') || (@: =~? '^se\s')
        exe @:.'!'
    endif
endfunction
""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
""""""""""""""""""""""""""""""

function! CmdLine(str)
    " menu，创建菜单；emenu，执行菜单(相当于单击菜单)；unmenu，删除菜单
    execute "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" 可视模式下按选择文本(选中的内容)执行查找搜索
function! VisualSelectionAmix(direction, extra_filter) range
    " 预存无名寄存器的内容
    let l:saved_reg=@"
    " :exe[cute] {expr1}，计算{expr1}，返回的字符串作为Ex命令执行（类似于JS的
    " eval()函数）
    " :norm[al][!] {commands}，在命令行模式上执行普通模式命令，!为不使用映射
    " vgvy，进入可视模式，重选上一次的选择区域(选区)，并复制该选区
    execute "normal! vgvy"

    " escape({string}, {chars})，将{string}中的{chars}字符用反斜杠转义
    " 注意：VimScript中双引号字符串与单引号字符串的区别：
    " 双引号字符串用于特殊的“转义序列”（如\n用于换行符、\u263A用于Unicode笑脸标志、
    " \<ESC>用于转义字符；而单引号字符串则将包括在其中的所有内容视为文字字符，比如
    " \n仅被视作\和n两个字面文字字符，而不视为换行符，但也要例外————两个连续的单引号，
    " 它们被单纯地当作单引号，换言之，单引号字符串里面作为字面文字字符的单引号
    " 必须在其前面加多一个单引号，以对其进行转义，否则会被视作单引号字符串的界定符。
    let l:pattern=escape(@", ' \/.*$^~[]')
    " substitute({expr}, {pat}, {sub}, {flags})：{expr}，要被替换操作的原文本；
    " {pat}，匹配模式(比如正则表达式)；{sub}，用以替换符合匹配模式的文本的文本
    " (子串)；{flags}，标志位，缺省为空""，则仅用{sub}替换第一个匹配，若设为g，
    " 则替换所有{pat}匹配。该函数返回经匹配替换后的新文本。
    " 下面这一句是将上次v模式选中的、经过escape()函数对特殊字符转义处理后的
    " 文本的行尾的换行符删除(若行末有换行符，则以空字符""替换，实际就是删除)
    let l:pattern=substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/=l:pattern
    let @"=l:saved_reg
endfunction

function! VisualSelectionArthurChiao(direction, extra_filter) range
    let l:saved_reg=@"
    execute "normal! vgvy"

    let l:pattern=escape(@", ' \/.*$^~[]')
    let l:pattern=substitute(l:pattern, "\n$", "", "")

    if a:direction == 'SearchBackward'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'SearchForward'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/=l:pattern
    let @"=l:saved_reg
endfunction
""""""""""""""""""""""""""""""

" 切换绝对行号、相对行号、无行号
function! s:ToggleLineNumber()
    " cpo，vi兼容性选项；这里的&表示获得选项变量的值
    let l:save_cpo=&cpo
    " se[t] {option}&vim：复位选项为Vim的缺省值
    set cpo&vim

    " number status
    " 1 -> nonumber
    " 4 -> relative number
    " 2 -> number
    "
    if !exists('b:number_status')
        "You may has multi-windows, so it should only working on local buffer
        if &l:relativenumber == 1
            let b:number_status=4
        elseif &l:number == 1
            let b:number_status=2
        else
            let b:number_status=1
        endif
    endif
    "
    if b:number_status == 1
        "set local number to make sure relative number like this (vim 7.4)
        "
        "   2
        "   1
        " 16  <- show current line number
        "   1
        "   2
        "
        setlocal number
        setlocal relativenumber
        let b:number_status=4
    elseif b:number_status == 4
        setlocal norelativenumber
        setlocal number
        let b:number_status=2
    elseif b:number_status == 2
        setlocal norelativenumber
        setlocal nonumber
        let b:number_status=1
    endif

    let &cpo=l:save_cpo
endfunction
""""""""""""""""""""""""""""""

" 切换滚动模式：文本逐行滚动(光标不动)、光标逐行移动
let s:scroll_mode=1
function! ToggleScrollMode()
    if exists("s:scroll_mode")
        "unmap k
        "unmap j
        noremap j gj
        noremap k gk
        unlet s:scroll_mode
	    echom "scroll mode off"
    else
        "nnoremap j <C-e>gj
        "nnoremap k <C-y>gk
        noremap j <C-E>gj
        noremap k <C-Y>gk
        let s:scroll_mode=1 
	    echom "scroll mode on"
    endif
endfunction
""""""""""""""""""""""""""""""

" 一键切换窗口最大化、还原窗口大小
function! ToggleWindowSize()
    if has("gui_running")
        if exists("s:window_max_status") 
            " 最大化窗口
            simalt ~x
            "set lines=999
            "set columns=999
            unlet s:window_max_status
        else
            " 还原窗口
            simalt ~r
            "set lines=25
            "set columns=86
            "winpos 930 675
            let s:window_max_status=1 
        endif
    endif
endfunction
call ToggleWindowSize()
""""""""""""""""""""""""""""""

" 如果存在session会话文件且可读，则执行该会话文件
function! s:ReadSession()
	let l:session_file=$VIM . "/vim74/Session.vim"
	if filereadable(l:session_file)
		execute "source " . l:session_file
	endif
endfunction
""""""""""""""""""""""""""""""

" 临时将当前窗口新开一个标签，在分屏多窗口的情况下，
" 相当于放大了该窗口；再次调用会关闭该新标签并
" 回到原窗口(仅限于未再新开标签的情况，否则导致混乱)，
" 相当于缩小了该窗口；其中，winsaveview()与winresetview()
" 函数用来将新开标签的窗口信息(光标位置等)应用回原窗口
function! ZoomWindowTemporarily()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if exists("s:is_zoom_window") && tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview=winsaveview()
        let l:cur_bufname=bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif

        unlet s:is_zoom_window
    else
        tab split
        let s:is_zoom_window=1
    endif
endfunction
