call plug#begin('~/.vim/plugged')

"缩进
Plug 'Yggdroot/indentLine'

"主题色
Plug 'crusoexia/vim-monokai'

"vim airline
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题

"nerd tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"彩色括号
Plug 'luochen1990/rainbow'

"nerd tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
		\ 'coc-marketplace',
		\ 'coc-json',
		\ 'coc-vimlsp',
		\ 'coc-markdownlint',
		\ 'coc-sh',
		\ 'coc-pyright',
		\ 'coc-yaml',
		\ 'coc-tabnine',
		\ 'coc-translator',
		\ 'coc-snippets',
		\ 'coc-xml',
		\ 'coc-clangd'
		\]

" Latex
Plug 'lervag/vimtex'

"cpp高亮
Plug 'octol/vim-cpp-enhanced-highlight'

" Markdown 
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" " Script
Plug 'lilydjwg/fcitx.vim'

call plug#end()

"对齐
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"----------------------------------------------------------------
" Vim - Airline Configure
"----------------------------------------------------------------
let g:airline_theme="desertink"                   " 主题配色
" let g:airline_theme="nord"                   " 主题配色
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
	
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" 这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 置关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" 自动退出
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"---------------------------------------------
"NerdTree
"---------------------------------------------

" autocmd vimenter * NERDTree  "自动开启Nerdtree

let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小

let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks

"打开vim时如果没有文件自动打开NERDTree

" autocmd vimenter * if !argc()|NERDTree|endif

"当NERDTree为剩下的唯一窗口时自动关闭

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 设置树的显示图标

let g:NERDTreeDirArrowExpandable = '+'

let g:NERDTreeDirArrowCollapsible = '-'

let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示

let g:NERDTreeShowLineNumbers=0 " 是否显示行号

let g:NERDTreeHidden=0     "不显示隐藏文件

""Making it prettier

let NERDTreeMinimalUI = 1

let NERDTreeDirArrows = 1

nnoremap <F3> :NERDTreeToggle<CR>  "开启/关闭nerdtree快捷键

source .config/nvim/rainbow.vim
source .config/nvim/coc.vim

"--------------------------------------------------------
"              vim基本配置
"---------------------------------------------------------
colo monokai
set nu
syntax on
set ts=4
set sts=4
set sw=4
set autoindent
set cindent

set incsearch


"----------------------------------------------------------------
" Encoding configure
"----------------------------------------------------------------
"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
set encoding=utf-8
set langmenu=en_US.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
"设置为双字宽显示
set ambiwidth=double
set mouse-=a

"set fdm=indent " 代码折叠
set fdm=marker

" colorscheme nord
"----------------------------------------------------------
" Map Configure 
"----------------------------------------------------------
nmap <F2> :e %<.cpp<CR>
nmap <F3> :e %<.in<CR>
nmap <F4> :e %<.out<CR>
nmap <F5> :call Debug()<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :!gedit "%"<CR>
nmap <F12> :call Compile()<CR>

set pastetoggle=<F6>

" 设置切换Buffer快捷键
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>

"----------------------------------------------------------
" User Function Configure 
"----------------------------------------------------------

let g:compile_options='-lm -std=c++20 -Wall -Wextra -Wshadow -Dllt -fsanitize=address'
" let g:compile_options='-lm -std=c++20 -Wall -Wextra -Dwoshiluo'
func! Debug()
	if expand( '%:e' ) == 'cpp' 
		exec '!g++ %<.cpp -o %<.run -g -DDEBUG ' . g:compile_options . '&& gdb ./%<.run'
	elseif expand( '%:e' ) == 'py'
		exec '!python -m pdb ./%'
	endif
endfunc

func! Compile()
	if expand( '%:e' ) == 'html'
		exec '!firefox %:p'
	elseif expand( '%:e' ) == 'tex' 
		exec '!(tectonic % ) && echo "50\%..." && (tectonic %>/dev/null 2>&1) && echo "100\%...Done" && ( rm -f %<.aux %<.log %<.toc %<.out %<.nav %<.snm) && firefox %<.pdf'
	elseif expand( '%:e' ) == 'md' 
		exec '!md2pdf.sh %<.md %<.pdf && firefox %<.pdf'
	elseif expand( '%:e' ) == 'rs'
		exec '!cargo run'
	elseif expand( '%:e' ) == 'py'
		exec "!python %"
	elseif expand( '%:e' ) == 'r'
		exec "!R %"
	elseif expand( '%:e' ) == 'cu'
		exec '!nvcc %<.cpp -o %<.run && time ./%.run'
	else
		exec '!g++ %<.cpp -o %<.run -O2 ' . g:compile_options . ' && time ASAN_OPTIONS=detect_leaks=0 ./%<.run'
	endif
endfunc
