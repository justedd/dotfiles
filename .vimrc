set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set smartcase
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"ui
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

" colour schemes
Plugin 'chriskempson/base16-vim'

"code
"Plugin 'ternjs/tern_for_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'maxbrunsfeld/vim-yankstack'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'metakirby5/codi.vim'

Plugin 'easymotion/vim-easymotion'

" % for ruby
Plugin 'endwise.vim'

Plugin 'mhinz/vim-grepper'

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

" sniplets
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'

"Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'peterhoeg/vim-qml'
Plugin 'EdTsft/vim-qrc'

Plugin 'tpope/vim-unimpaired'

Plugin 'dkprice/vim-easygrep'
Plugin 'mileszs/ack.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"========================================== end of vundle section ===================================

set number
set norelativenumber
"space to leader
let mapleader=" "

"indents and tabs
set expandtab
set shiftwidth=2
set softtabstop=2

set hlsearch


"tag test start
nmap <F8> :TagbarToggle<CR>
"tag test end

"indentline color (guessed)
let g:indentLine_color_term = 239

"set tern_for_vim as def js for YCM
autocmd FileType javascript setlocal omnifunc=tern#Complete

"show tabline form air-line
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_splits = 0
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
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }
"syntastic checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_jade_checkers = ['jade_lint']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_loc_list_height=1

"remove bottom frame
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0


" use multiple checkers
let g:syntastic_aggregate_errors = 1

"jsx highlight not only jsx files
let g:jsx_ext_required = 0


"Hotkeys
nmap <Leader>n :NERDTreeToggle<CR>

"ctrl-p
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'

nmap <C-p> :CtrlPBuffer<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" maximize
nnoremap <Leader>m <C-W>\| <C-W>_

" copy to X buffer
xmap <Leader>y "+Y 

nmap <Leader>l :CodiUpdate<CR>:w<CR>
nmap <Leader>l :w<CR>:SyntasticCheck<CR>
nmap <Leader>L :SyntasticReset<CR>

nmap <Leader>R :!ruby %<CR>
nmap <Leader>T :!rspec <CR>

nmap <C-s> :YcmCompleter GoTo<CR>

nnoremap <CR> :noh<CR><CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
 " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


let g:airline_powerline_fonts = 1

set diffopt+=vertical

let g:vim_json_syntax_conceal = 0

let g:indentLine_faster = 0

" json auto hide quotes
"set conceallevel=0

set shell=/bin/sh

let g:UltiSnipsUsePythonVersion = 2

se backupdir=~/.vim/swp

let EasyGrepRecursive=1
let g:EasyGrepCommand="ack"
let g:EasyGrepFilesToExclude="*.log"

let g:airline#extensions#whitespace#enabled = 0

set regexpengine=1
let g:easytags_async=1
let g:easytags_auto_highlight=0

set foldmethod=indent
set foldlevel=0
" prevent automatic open folds in search
set fdo-=search

" async grep conf
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0
" end of async grep

let g:codi#autocmd = 'None'

let g:yankstack_map_keys = 0
nmap <leader>k <Plug>yankstack_substitute_older_paste
nmap <leader>j <Plug>yankstack_substitute_newer_paste

" color scheme settings  =========================================================================================
let base16colorspace=256

"remove dashes in folds
set fillchars=fold:\ 

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" unknown fix for base16 and tmux
if has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app' && $TERM !~# '^\%(screen\|tmux\)'
  set termguicolors
else
  set notermguicolors
endif

let g:airline_theme='base16_default'

" end ofcolor scheme settings  ===================================================================================
