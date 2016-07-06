" ����ΪVim���������Vundle������(Ҫ�����vimrc����ǰ��)
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=$VIM/vimfiles/bundle/Vundle.vim  |" Vundle.vimΪ�ļ���
" ����İ�װ·��(����ָ��vundle#begin()�е�·����Ĭ��ΪC:\users\***\.vim)
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
" ע��Ҫɾ��һ����Vundle����Ĳ������Ҫ��ɾ����ע�͵���Plugin '�����'����Ȼ
" ����ִ��:PluginClean����ŻὫ������Vundle����Ĳ��ɾ���������޷�ɾ��
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ����ΪVim���������Vundle������


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
" filetype���Vim����Ҫ�༭���ļ����͡�����ͨ������ļ�����ɵģ�
" ��ʱ��Ҳ����ı����Ƿ�����ض����ı���ÿ��һ���µĻ����Ѿ����ڵ�
" �ļ����༭ʱ��Vim����ͼʶ���ļ������ͣ�������filetypeѡ�ͬʱ��
" Ҳ����FileType�¼������¼����������﷨�������ض�ѡ��ȵȡ�
"filetype plugin on
"filetype indent on

" �ļ���Vim�ⱻ�Ķ�ʱ�Զ����¶��룻���ļ����ⲿ��ɾ�������¶���
set autoread

" With a map leader it's possible to do extra key combinations
" like <LEADER>w saves the current file
let mapleader="\<space>"

" ���ô�������λ�ã�x�� y�᡾���Ͻ�Ϊ��x=0 y=0��
winpos 930 675
" ���ô��ڴ�С���к���
"let windowlines=25
"let windowcolumns=86
"set lines=25
"set comlumns=86
"set lines=&windowlines columns=&windowcolumns 
set lines=25 columns=86 

" ��������ƶ�ʱ����Ļ�ϱ�����������Ļ����
set scrolloff=2

" ��ǿģʽ�����в�ȫ������wildchar(Ĭ��<Tab>)������ȫ
set wildmenu

" Height of the command bar
"set cmdheight=2
" �����д��ڸ߶�(��Ļ����)
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

" ������ʾ���������
set cursorline
" ������ʾ��������С���д������ cuc��ȡ�� nocuc��
"set cursorcolumn
 
" Default Colors for CursorLine
"highlight CursorLineNr guifg=red

" ��һ�и�ĳδ֪�ű��г�ͻ���ŵ�
" colorshceme�ļ�(desert.vim)�вŽ��
"highlight LineNr guifg=Brown

" Change Color when entering Insert Mode
" au[tocmd] [group] {event} {pat} [nested] {cmd}����{cmd}�ӵ�Vim��ƥ��{pat}
" ģʽ���ļ�ִ��{event}�¼�ʱ�Զ�ִ�е������б��С�Vim�ܰ�{cmd}�ӵ����е�
" �Զ�����֮��������֤�Զ������ִ��˳�����䶨���˳����ͬ��
autocmd InsertEnter * highlight LineNr guifg=Red
autocmd InsertEnter * set cursorcolumn
autocmd InsertEnter * highlight statusline guifg=Red

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight LineNr guifg=#909194
autocmd InsertLeave * set nocursorcolumn
autocmd InsertLeave * highlight statusline guifg=NONE

" ���ù�겻��˸
set gcr=a:block-blinkon0

" ����к�
set number
" �������к�
set relativenumber

" �����ƶ������ƶ����ʱ�����ص����׵�һ���ǿհ��ַ�,
" ���Ǿ���������ͬһ����(������ܵĻ�)��
" C-B��C-F��C-D��C-U��G��H��M��L��gg��d��<<��>>����������%��
" �������ı�����(CTRL-^��:bnext��:bNext��)��:25��:+��:-��
set nostartofline

"" ����Ĭ�ϱ��� 
"set encoding=utf-8 
"set fileencodings=utf-8,chinese,latin-1 
"if has("win32") 
"    set fileencoding=chinese 
"else 
"    set fileencoding=utf-8 
"endif 
"
"" ����˵����� 
"source $VIMRUNTIME/delmenu.vim 
"source $VIMRUNTIME/menu.vim 
"
"" ���console������� 
"language messages zh_CN.utf-8 

" ���ö����Ի��������������������
if has("multi_byte")
    " Vim�ڲ�ʹ�õı��� 
    set encoding=utf-8
    " Windows�µ�gVim������������Ļ��ʾ��������termencoding
    "set termencoding=utf-8
    " �Զ��Ű�ʱ�ĸ�ʽѡ��
    set formatoptions+=mM
    " ���ļ�ʱVim�Զ�����ļ����뷽ʽ�ı����б��
    " prc(��ͬ��chinese)��Windows�µ�cp936��Unix�µ�euc-cn
    set fileencodings=ucs-bom,utf-8,prc,gb18030,taiwan,japan,korea,latin1
    " ����CJK���Ƕ����Կ���ַ��� (East Asian Width Class Ambiguous)
    " ���磬ŷԪ���š�ע��Ǻš���Ȩ�Ǻš�ϣ����ĸ���������ĸ�ȵ�
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        " ����˵����� 
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        " ���console������� 
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" ����ɫ��Ĭ�ϵİ�ɫ̫������ 
"colorscheme desert 
"colorscheme morning
"colorscheme evening
colorscheme dracula
" ���﷨��������(dracula��ɫ������Ҫ��)
" syntax on�Ḳ�����е���ɫ����syntax enable�ᱣ�ֵ�ǰ���е�ɫ�����ã�
" ֻ����û�����ù����飻����������ʹ�ô������ǰ�󣬶��������Լ�ϲ������ɫ��
syntax on
"syntax enable

" ����ģʽ��ѡ���ı�ʱ��ʹ�����и��ơ�ɾ���Ȳ�����
" Ҳ�Զ���ѡ���ı����浽"*�Ĵ���(ϵͳ�����壬
" windowsϵͳ�У���"+�Ĵ�����ͬ)����˿���һ������
"set guioptions+=a
" ָ��Vim���ڶ���ÿ����ǩҳ��ǩ������ 
set guitablabel=%M\ %t

" ʹ"*�Ĵ���(ϵͳ������Ĵ���)��Ч��""�����Ĵ���(VimĬ�ϼĴ���)��
" �Ա���Windows���ü����壻��������ʵ��ʹ�ù����з��֣�
" Vim�е�ɾ��������ֱ��ճ�����������򣬸��Ʋ���ȴ���У�
" �����������еĸ��ơ�ɾ���������������Vim��ֱ��ճ����
set clipboard=unnamed

" ��ݼ�ӳ�� {
    " facilitate screen move
    " ��������
    "nnoremap <S-CR> :let b:curPos=getpos(".")<CR> <C-F> :call setpos(".", b:curPos)<CR> :unlet b:curPos<CR>
    "nnoremap <S-CR> <C-F>zz
    nnoremap <S-CR> <C-D><C-D>
    "nnoremap <S-BS> :let b:curPos=getpos(".")<CR> <C-B> :call setpos(".", b:curPos)<CR> :unlet b:curPos<CR>
    "nnoremap <S-BS> <C-B>zz
    nnoremap <S-BS> <C-U><C-U>
    " ��������
    nnoremap <C-CR> <C-D>
    nnoremap <C-BS> <C-U>
    nnoremap <C-J>  <C-D>
    nnoremap <C-K>  <C-U>
    "nnoremap <SPACE><SPACE> <C-D>
    "nnoremap <S-SPACE><SPACE> <C-U>
    " ����һ��
    nnoremap <C-S-CR> <C-E>gj
    nnoremap <C-S-BS> <C-Y>gk
    "nnoremap <DOWN>  <C-E>
    "nnoremap <UP>    <C-Y>

    " Treat long lines as break lines������ʾ�������ƶ������ǰ��ı��У��� 
    " �����趨Ϊ�ı����й��������ǹ�������ƶ�����������Ļ��λ��
    " �̶���������F3���л������ַ�ʽ��
    noremap j <C-E>gj
    noremap k <C-Y>gk

    " go to older jump position(contrast with Tab or C-I)
    noremap <S-TAB> <C-O>
    
    " ����ģʽ�£��ƶ�����ǰ�����ס���β������
    nnoremap <C-H> ^
    nnoremap <C-L> $
    noremap 0      ^
    noremap -      :call cursor(line("."), col("$")/2)<CR>
    noremap=     $

    " ��������ǰ������ð��:��Ϊ�ֺ�;
    "nnoremap ; :

    " ����ģʽ��������ģʽ���ƶ���ɾ��
    inoremap <C-H> <LEFT>
    inoremap <C-J> <Down>
    inoremap <C-K> <UP>
    inoremap <C-L> <RIGHT>
    inoremap <C-D> <DELETE>
    cnoremap <C-H> <LEFT>
    cnoremap <C-L> <RIGHT>
    cnoremap <C-D> <DELETE>

    " ����ģʽ�£��س�ΪESC��Shift+�س�Ϊ�س�
    "inoremap <S-CR> <CR>
    "inoremap <CR> <ESC>
    " i��v��cģʽ�£�jj��C-N��������ģʽ
    inoremap jj    <ESC>
    inoremap <C-N> <ESC>
    vnoremap <C-N> <ESC>
    cnoremap <C-N> <ESC>
    
    " ����ģʽ�£������ϡ����ж�Ӧ���ַ�
    inoremap <C-BS> <C-Y>
    inoremap <C-CR> <C-E>

    " �л���ǩҳ����Windows�б�ǩҳ�л��ĳ��������ͬ
    nnoremap <C-TAB>   gt
    nnoremap <C-S-TAB> gT

    " ��������(�ര�ڲ���)
    " ����VimScript�е�ע����һ��˫���ſ�ʼ����ʱ������
    " ˫�����ַ����е�˫���Ż���(��Щ������ܸ�ע�ͣ���Ϊ
    " �ַ���������ע��)����ˣ����������к����ע��ǰ����
    " ����ָ���|(���ڷָ����ڵ����ϵĶ���Ex�������)���������
    nnoremap ,c <C-W>c  |" �رմ���
    nnoremap ,s <C-W>s  |" ˮƽ�ָ��
    nnoremap ,v <C-W>v  |" ��ֱ�ָ��
    nnoremap ,h <C-W>h  |" ������Ƶ���ߴ���
    nnoremap ,j <C-W>j  |" ������Ƶ��±ߴ���
    nnoremap ,k <C-W>k  |" ������Ƶ��ϱߴ���
    nnoremap ,l <C-W>l  |" ������Ƶ��ұߴ���
    nnoremap ,w <C-W>w  |" ������Ƶ���һ������
    nnoremap ,H <C-W>H  |" ����ǰ�����Ƶ���� 
    nnoremap ,J <C-W>J  |" ����ǰ�����Ƶ��ϱ�
    nnoremap ,K <C-W>K  |" ����ǰ�����Ƶ��±�
    nnoremap ,L <C-W>L  |" ����ǰ�����Ƶ��ұ�
    nnoremap ,= <C-W>=  |" ʹ���зִ���һ����
    nnoremap ,+ <C-W>+  |" ���ӵ�ǰ���ڵĸ߶�
    nnoremap ,- <C-W>-  |" ���ٵ�ǰ���ڵĸ߶�
    nnoremap ,> <C-W>>  |" ���ӵ�ǰ���ڵĿ��
    nnoremap ,< <C-W><  |" ���ٵ�ǰ���ڵĿ��
    nnoremap ,T <C-W>T  |" �����зִ���ת����ǩ

    " ��Yӳ��Ϊ�ӹ�굱ǰλ�ø��Ƶ���β��
    " ����D��C�ȴ�д��ĸ����Ϊͳһ������
    " ���ҽ��������ݻ��Ե��������С�
    " ���У�echom[sg] {expr1}�����Ա��ʽ�Ľ����������Ϊһ��
    " ��������Ϣ�����Ѹ���Ϣ������message-history���echo���ƣ�
    " ��������ʾ���ַ�ֻ���Զ����ᱻ���ͣ�@0����������ģʽ��
    " Exģʽ�У�@��ʾ�Ĵ�������ͬ����ͨģʽ����"��ʾ�Ĵ���
    noremap Y y$ :echom "Copied Text: " . @0<CR>3h
    nnoremap yy yy :echom "Copied Text: " . @0<CR>3h  
    vnoremap y y :echom "Copied Text: " . @0<CR>h
" }

" Disable highlight when <LEADER><cr> is pressed
map <LEADER>h :noh<CR>

" ��ͨģʽ�²��뻻�з�
map <LEADER><CR> i<CR><ESC>

" �������ļ�
map <LEADER>ev :edit $MYVIMRC<CR>
" ���������ļ�
map <LEADER>es :source $MYVIMRC<CR>

" �����ļ����˳�
map <LEADER>w :wq<CR>
" �����ļ�,���˳�
map <LEADER>s :update<CR>
" �ļ�û���޸���ֱ���˳�
map <LEADER>q :q<CR>
" �ļ�û���޸���ȫ���˳�
map <LEADER>x :qa<CR>

" ��ͨģʽ�²���һ������
nmap <LEADER>o o<ESC>
nmap <LEADER>O O<ESC>

" ������һ��������set����
map <LEADER>u :call UndoSetCommand()<CR>
" �ظ���һ�������в���
map <LEADER>r :@:<CR>

" ��ͨģʽ�²��뵥���ַ�
nmap <LEADER>i i <ESC>r
nmap <LEADER>a a <ESC>r

" �������ģʽ��ѡ����(��ѡ����)��ģʽ
nnoremap <LEADER>v <C-V>
" ����ģʽv/V��ģʽ�£��Կ��л�����ѡ��ģʽ
vnoremap <LEADER>v <C-V>

" n��v��oģʽ��ճ��"0����ר�üĴ����е�����
noremap <LEADER>p "0p
noremap <LEADER>P "0P

" �������л�
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
" �г����б�ǩҳ
map <LEADER>ta :tabs<CR>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <LEADER>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <LEADER>cd :cd %:p:h<cr>:pwd<cr>

" ����ʱ����ǰ���ڷŴ�һ���±�ǩ�Լ��رո��±�ǩ����ԭ����֮���л�
map <LEADER>z :call ZoomWindowTemporarily()<CR>

" Specify the behavior when switching between buffers 
" try��endtry���ı�try��endtry֮������Ĵ�������������
" ִ�е����ݡ�source�������������á��Զ�����ļ���ȡ�
" cat[ch] /{pattern}/��ƥ��{pattern}�������׳�ʱ�������û�б�ǰһ��
" catch������ִ�б����֮������ֱ�������ͱ�catch����ͬһtry���
" ��һ��catch��finally����endtryΪֹ��������Щ���������
" ��û���ṩ{pattern}�����еĴ��󶼻ᱻ����
try
" ���ƻ������л�����Ϊ��
" useopen��������һ���򿪵İ���ָ���������Ĵ���(����еĻ�)��
" usetab��������useopen����Ҳ����������ǩҳ��Ĵ��ڣ�
" split��������������quickfix��������ʾ����Ļ�����֮ǰ�ָǰ���ڣ�
" newtab��������split�������±�ǩҳ������splitͬʱ���ڣ���ֵ���ȡ�
  set switchbuf=useopen,usetab,newtab
  " Ĭ��ֵΪ1��������һ����ǩҳ����ʾ��ǩ��
  "set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" viminfo�е�%����������ͻָ��������б�Vim����ʱ�����ļ���������
" �������б���ָ�����û���ļ����������������б��viminfo�ļ���ָ���
" û���ļ����ĺͰ����ļ��Ļ���������д��viminfo�ļ����������ֵ��
" ����ֵָ������Ļ�����������������û����ֵ���򱣴����еĻ�������
" se[t] {option}^={value}����{value}�˵���ֵѡ������߸��ӵ��ַ���
" ѡ��֮ǰ�����ѡ���Ƕ��ŷָ����б�����ԭ����ֵΪ�գ������һ�����š�
set viminfo^=%

" �����кš�����кš����к��л�
" com[mand][!] [{attr}...] {cmd} {rep}������һ���û���������������
" {cmd}�����滻���ı���{rep}�������������(�ο��ֲ�)��{attr}�������
" �����Ѵ��ڣ���������ָ��!���������������ض��塣
command! Tln call s:ToggleLineNumber()
nnoremap <F2> :Tln<CR>

" �л�����ģʽ���ı����й���(��겻��)����������ƶ�
command! Tsm call ToggleScrollMode()
nnoremap <F3> :call ToggleScrollMode()<CR>

"Toggle Menu and Toolbar �л����޲˵������������͹�����
set guioptions-=m  |" m���˵���
set guioptions-=T  |" T��������
set guioptions-=r  |" r���ұ߹�����
set guioptions-=L  |" L����ֱ�ָ��ʱ��߹�����
" =~#��ƥ���Сд����ʹ��������ignorecase
" <Bar>����Ex����ָ���|��\Ϊ���з�(���н�����)
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

" һ���л�������󻯡���ԭ���ڴ�С
map <F11> :call ToggleWindowSize()<CR>

" %Ĭ��ƥ��()��[]��{}������ƥ��<>
set matchpairs+=<:>

" ��ͨģʽ�µ�ǰ�������ı��޸ġ��˳�����ģʽ���뿪��������ʧȥ����ʱ���Զ������ļ�
autocmd TextChanged,InsertLeave * update
autocmd BufLeave,FocusLost * wall

"" �Զ���������(�Զ����桢��ȡ��ִ��session�Ự�ļ�)
"cd $vim/vim74   "���뱣��session�Ự�ļ���Ŀ¼
"" sesstionoptions���ı�mksession�����Ч�������Ƕ��ŷָ��ĵ����б�
"" ÿ������������ͻָ�ĳ�����ã�curdir����ǰĿ¼��sesdir����session
"" �Ự�ļ����ڵ�Ŀ¼�л��ɵ�ǰĿ¼
""set sessionoptions-=resize
""set sessionoptions+=sesdir 
"set sessionoptions+=winpos,globals
"" mks[ession][!] [file]��д��һ��Vim�ű����ýű��ܹ��ָ���ǰ�ı༭�Ự��
"" �������[!]�����е��ļ��ᱻ���ǡ������ṩ[file]��Ĭ�ϱ���Ϊ"session.vim"��
"" ע�⣺���ṩ[file]�����ܼ�.vim��չ����׺���������(vim���Զ���)
"autocmd VimLeave * mksession!
"autocmd VimEnter * :call s:ReadSession()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

" Persistent undo �ļ��رպ��ٴ��Կɳ������ָ��ϴεı༭����
"set undodir=~/.vim/undodir
set undofile
" maximum number of changes that can be undone
"set undolevels=1000  " ��ΪĬ�����ã�����ע�� 
" maximum number lines to save for undo on a buffer reload
"set undoreload=10000 " ��ΪĬ�����ã�����ע�� 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" ����ģʽ�в���<Tab>ʱʹ�ú��������Ŀո�Ҫ����ʵ�ʵ��Ʊ���CTRL-V<Tab>
set expandtab

" Be smart when using tabs ;)
" ���׵�<Tab>����shiftwidth����հף�tabstop��softtabstop���ڱ�ĵط���
" <BS>ɾ������shiftwidth��ô��Ŀհף���ѡ�����رգ�<Tab>���Ǹ���tabstop
" ��softtabstop��������հ׵���Ŀ��shiftwidthֻ�����ı����ƻ����ơ�
" ����հ׵ľ��巽ʽ (�Ʊ��ǿո�) ȡ����expandtabѡ�
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
"set wrap  " ��ΪĬ�����ã�����ע�� 

""""""""""""""""""""""""""""""
" ���뷨���� 
""""""""""""""""""""""""""""""
" ��ͨģʽ���Զ��������ģ����ɽ������ı��
set noimdisable
" �������뷨�ļ����
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
" ״̬�����ã�%<���й�������ͷ�ض̣�CFP����ǰ�ļ�·����%F����ʾ����·����
" %m���޸ı�־λ��%r��ֻ����־λ��%h��������־λ��%w��Ԥ�����ڱ�־λ��
" FMT���ļ���ʽ��%{&fileformat}��%{}��ʾ������ʽ��&��ʾȡ��ѡ�������ֵ��
" TYPE���ļ����ͣ�%Y���ļ����ͣ�%b����������ַ���10�������ֵ��.9�������ʾ9λ��
" %B����������ַ���16�������ֵ��CWD����ǰ����Ŀ¼��%=����������Ҷ���ķֽ�㣻
" %c���кţ�%V�������кţ���ʾΪ������%p����ǰ�����ļ�λ�õİٷֱȣ�
" %P���������ļ�λ�õİٷֱȣ�%%����ʾ%�ű���%L���ļ������������������
"set statusline=%<[CFP=%F]%m%r%h%w\ [FMT=%{&fileformat}]\ [TYPE=%Y]\ [%.9b\ 0x%.9B]\ [CWD=%{getcwd()}]\ %=[%l,%c%V\ %p%%\ %P\ %LLs]
"let g:airline_section_b='%<[CFP=%F]%m%r%h%w\ [FMT=%{&fileformat}]\ [TYPE=%Y]\ [%.9b\ 0x%.9B]\ [CWD=%{getcwd()}]'
"let g:airline_section_y='[%l,%c%V\ %p%%\ %P\ %LLs]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ����airline������statusline��powerline�Ĵ�vimʵ�֣�����Python֧�֣�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ����vim-airline������Ϊluna
"let g:airline_theme="luna" 

" ��װ����󣬱������ô��� 
let g:airline_powerline_fonts=1   

" ��tabline���ܣ�����鿴Buffer���л���������ܱȽϲ���
" ��1��Tab�¿��ö��buffer��ʡȥ��װminibufexpl�����
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" �ر�״̬��ʾ�հ׷��ż���
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#symbol='!'

" Windowsϵͳ����Ҫ�������������������´���
" ����consolas����"
set guifont=Consolas\ for\ Powerline\ FixedD:h11

" ����״̬��������ʾ�����������˫����
let g:Powerline_symbols="fancy"
let g:airline_symbols={}
let g:airline_left_sep="\u2b80" 
let g:airline_left_alt_sep="\u2b81"
let g:airline_right_sep="\u2b82"
let g:airline_right_alt_sep="\u2b83"
let g:airline_symbols.branch="\u2b60"
let g:airline_symbols.readonly="\u2b64"
let g:airline_symbols.linenr="\u2b61"

" ���ö���tabline��������ʾ
let g:airline#extensions#tabline#left_sep="\u2b80"
let g:airline#extensions#tabline#left_alt_sep="\u2b81"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ����airline����
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VimEnter�¼�(���������������񣬰�������.vimrc�ļ���ִ��"-c cmd"������
" �������д��ڲ��������������л�����)֮����󻯴��ڡ�
" simalt�������Vim(winaltkeys��Ҫ����Ϊyes)����һ��Windows����Alt������Ϊ��
" ��������������ӳ��Alt��ϼ�(�����κ�������)��������׼��Windows�������Ա���
" ��Windows�м�ʹ����Alt-{key}���ʲ˵��ı�׼����(winaltkeys����Ϊno)��
" Ҳ��ͨ��simalt��ģ����ʲ˵������У�~��simalt�����д���ո�<Space>��
autocmd VimEnter * simalt ~x
let s:window_max_status=1


"***************************************************************
""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""
" �����ո�ִ�е�set��������
" fu[nction][!] {name}([arguments]) [range] [abort] [dict]��
" ����{name}�������º��������ֱ�������ĸ���ֺ� ��_�� ��
" ����ɣ����ұ����Դ�д��ĸ����"s:"��ͷ��
" ����ͬ��������û��ʹ��[!]������������Ϣ��������[!]�����еĺ���
" ����Ȼ��������ú�������ִ���ڼ���⡣��ʱ������һ������
" �������[range]��������ú����Լ�����Ⲣ�����з�Χ���÷�Χͨ��
" a:firstline��a:lastline���塣���û��[range]��:{range}call
" ���ڸ÷�Χ��ÿһ�зֱ�ִ�иú�����ÿ�ι�궼��λ�ڴ����е����ס�
" ��|function-range-example|��
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
    " menu�������˵���emenu��ִ�в˵�(�൱�ڵ����˵�)��unmenu��ɾ���˵�
    execute "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" ����ģʽ�°�ѡ���ı�(ѡ�е�����)ִ�в�������
function! VisualSelectionAmix(direction, extra_filter) range
    " Ԥ�������Ĵ���������
    let l:saved_reg=@"
    " :exe[cute] {expr1}������{expr1}�����ص��ַ�����ΪEx����ִ�У�������JS��
    " eval()������
    " :norm[al][!] {commands}����������ģʽ��ִ����ͨģʽ���!Ϊ��ʹ��ӳ��
    " vgvy���������ģʽ����ѡ��һ�ε�ѡ������(ѡ��)�������Ƹ�ѡ��
    execute "normal! vgvy"

    " escape({string}, {chars})����{string}�е�{chars}�ַ��÷�б��ת��
    " ע�⣺VimScript��˫�����ַ����뵥�����ַ���������
    " ˫�����ַ�����������ġ�ת�����С�����\n���ڻ��з���\u263A����UnicodeЦ����־��
    " \<ESC>����ת���ַ������������ַ����򽫰��������е�����������Ϊ�����ַ�������
    " \n��������\��n�������������ַ���������Ϊ���з�����ҲҪ���⡪���������������ĵ����ţ�
    " ���Ǳ������ص��������ţ�����֮���������ַ���������Ϊ���������ַ��ĵ�����
    " ��������ǰ��Ӷ�һ�������ţ��Զ������ת�壬����ᱻ�����������ַ����Ľ綨����
    let l:pattern=escape(@", ' \/.*$^~[]')
    " substitute({expr}, {pat}, {sub}, {flags})��{expr}��Ҫ���滻������ԭ�ı���
    " {pat}��ƥ��ģʽ(����������ʽ)��{sub}�������滻����ƥ��ģʽ���ı����ı�
    " (�Ӵ�)��{flags}����־λ��ȱʡΪ��""�������{sub}�滻��һ��ƥ�䣬����Ϊg��
    " ���滻����{pat}ƥ�䡣�ú������ؾ�ƥ���滻������ı���
    " ������һ���ǽ��ϴ�vģʽѡ�еġ�����escape()�����������ַ�ת�崦����
    " �ı�����β�Ļ��з�ɾ��(����ĩ�л��з������Կ��ַ�""�滻��ʵ�ʾ���ɾ��)
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

" �л������кš�����кš����к�
function! s:ToggleLineNumber()
    " cpo��vi������ѡ������&��ʾ���ѡ�������ֵ
    let l:save_cpo=&cpo
    " se[t] {option}&vim����λѡ��ΪVim��ȱʡֵ
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

" �л�����ģʽ���ı����й���(��겻��)����������ƶ�
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

" һ���л�������󻯡���ԭ���ڴ�С
function! ToggleWindowSize()
    if has("gui_running")
        if exists("s:window_max_status") 
            " ��󻯴���
            simalt ~x
            "set lines=999
            "set columns=999
            unlet s:window_max_status
        else
            " ��ԭ����
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

" �������session�Ự�ļ��ҿɶ�����ִ�иûỰ�ļ�
function! s:ReadSession()
	let l:session_file=$VIM . "/vim74/Session.vim"
	if filereadable(l:session_file)
		execute "source " . l:session_file
	endif
endfunction
""""""""""""""""""""""""""""""

" ��ʱ����ǰ�����¿�һ����ǩ���ڷ����ര�ڵ�����£�
" �൱�ڷŴ��˸ô��ڣ��ٴε��û�رո��±�ǩ��
" �ص�ԭ����(������δ���¿���ǩ������������»���)��
" �൱����С�˸ô��ڣ����У�winsaveview()��winresetview()
" �����������¿���ǩ�Ĵ�����Ϣ(���λ�õ�)Ӧ�û�ԭ����
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
