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
"set cursorcolumn

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
Plugin 'szw/vim-maximizer'
"Plugin 'mhinz/vim-startify'


"code
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'BufOnly.vim'
Plugin 'mattn/emmet-vim'
"Plugin 'vim-multiple-cursors'   "has bugs with opening file, and useles

"tag test start
"Plugin 'majutsushi/tagbar'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
"tag test end


"tools
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-rvm'



Plugin 'ConradIrwin/vim-bracketed-paste'




"Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'









" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"tag test start
nmap <F8> :TagbarToggle<CR>
"tag test end

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
set wildignore+=public/**
set wildignore+=*/public/**


"syntastic def config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }
"syntastic checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'reek']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_jade_checkers = ['jade_lint']
let g:syntastic_jade_checkers = ['jade_lint']
let g:syntastic_loc_list_height=1

"let g:syntastic_quiet_messages=1
"

" use multiple checkers
let g:syntastic_aggregate_errors = 1

"jsx highlight not only jsx files
let g:jsx_ext_required = 0


"Hotkeys
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>o :BufOnly<CR>
nmap <Leader>p :CtrlPClearAllCaches<CR><c-p>


"nmap <Leader>; :tabNext<CR>
"nmap <Leader>l :tabprevious<CR>
nmap <Leader>s :bnext<CR>
nmap <Leader>a :bprevious<CR>
nmap <Leader>f :set foldmethod=syntax<CR>
nmap <Leader>m :MaximizerToggle<CR>

" x copy paste
xmap <Leader>y "+Y 

nmap <Leader>d :bd<CR>
nmap <Leader>l :w<CR>:SyntasticCheck<CR>
nmap <Leader>w :w<CR>
nmap <Leader>L :SyntasticReset<CR>

nmap <Leader>R :!ruby %<CR>
nmap <Leader>T :!rspec <CR>

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


let g:airline_powerline_fonts = 1

set diffopt+=vertical

let g:vim_json_syntax_conceal = 0

" json auto hide quotes
"set conceallevel=0

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
"
set shell=/bin/sh

set backupdir=~/.vim/swp
