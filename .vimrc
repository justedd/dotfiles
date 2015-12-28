set nocompatible              " be iMproved, required
filetype off                  " required

set number

"space to leader
let mapleader=" "

let g:molokai_original = 1

"indents and tabs
set expandtab
set shiftwidth=2
set softtabstop=2

colorscheme molokai




"set cursorline

set hlsearch


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"ui
Plugin 'scrooloose/nerdtree'
"Plugin 'wincent/Command-T'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-startify'


"code
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'BufOnly.vim'
"Plugin 'vim-multiple-cursors'   "has bugs with opening file, and useles

"tools
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'



"Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'









" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"indentline color
let g:indentLine_color_term = 239
"set tern_for_vim as def js for YCM
autocmd FileType javascript setlocal omnifunc=tern#Complete
"disable node_modules dir from command-t
"let g:CommandTWildIgnore=&wildignore . ",**/node_modules/*"
"show tabline form air-line
let g:airline#extensions#tabline#enabled = 1
"always show air-line
set laststatus=2
"disable popup window fro turn_for_vim
autocmd BufEnter * set completeopt-=preview
"always show gitgutter sign column for changes
let g:gitgutter_sign_column_always = 1
"disable node_modules for ctrlp
set wildignore+=node_modules/**
set wildignore+=*/node_modules/**


"syntastic def config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"syntastic checkers
let g:syntastic_js_checkers = ['jshint']
let g:syntastic_loc_list_height=1


"Hotkeys
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>o :BufOnly<CR>
nmap <Leader>p :CtrlPClearAllCaches<CR><c-p>


nmap <Leader>u :tabNext<CR>
nmap <Leader>y :tabprevious<CR>
nmap <Leader>t :bnext<CR>
nmap <Leader>r :bprevious<CR>

"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>
nnoremap <CR> :noh<CR><CR>
"ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
 " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)




" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
