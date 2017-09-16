" *** vundle required section
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set smartcase

" ******************************* VUNDLE START ***********************
Plugin 'VundleVim/Vundle.vim'

" *** ui
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'

" *** orgmode
Plugin 'jceb/vim-orgmode'
Plugin 'speeddating.vim'

" colour schemes
Plugin 'chriskempson/base16-vim'

" *** code 
"Plugin 'ternjs/tern_for_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'metakirby5/codi.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'endwise.vim'

" *** tags
"Plugin 'majutsushi/tagbar'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'

" *** tools
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-grepper'
Plugin 'tpope/vim-rvm'
Plugin 'dkprice/vim-easygrep'
Plugin 'mileszs/ack.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'

" *** complition and snippets
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'

" *** syntax
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
Plugin 'tpope/vim-rails'

" *** end of plugins list
call vundle#end()            " required
filetype plugin indent on    " required
"
" ******************************* VUNDLE END *************************

" ******************************* INTERNALS SETTINGS START ***********

" better function start/end matching
runtime macros/matchit.vim 

set number
set norelativenumber

" use space as leader
let mapleader=" "

" indents and tabs
set expandtab
set shiftwidth=2
set softtabstop=2
" tab size for not expanded files
set tabstop=2

set hlsearch
set incsearch

"remove dashes in folds
set fillchars=fold:\ 

" disable concealing json quotes
set conceallevel=0

set diffopt+=vertical
set shell=/bin/sh

set backupdir=~/.vim/swp

set foldmethod=indent
set foldlevel=3
" prevent automatic open folds in search
set fdo-=search
set nofoldenable

" ******************************* INTERNAL SETTINGS END *************

" ******************************* PLUGIN SETTINGS START *************
" airline show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
" airline show always
set laststatus=2

"always show gitgutter sign column for changes
set signcolumn=yes

" set omnifunc for js
autocmd FileType javascript setlocal omnifunc=tern#Complete

"disable popup window fro turn_for_vim
autocmd BufEnter * set completeopt-=preview

let g:NERDSpaceDelims = 1

"disable node_modules for ctrlp
set wildignore+=node_modules/**
set wildignore+=*/node_modules/**
set wildignore+=public/**
set wildignore+=*/tmp/*,*/log/*,*.so,*.swp,*.zip,moc_*.cpp,moc_*.h,ui_*.cpp,ui_*.h

" *** syntastic def config
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

" *** end of syntastic section

" *** grepper settings
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0
" *** end of async grep

let g:codi#autocmd = 'None'

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

let g:vim_json_syntax_conceal = 0

let g:indentLine_faster = 0

let g:UltiSnipsUsePythonVersion = 2

let EasyGrepRecursive=1
let g:EasyGrepCommand="ack"
let g:EasyGrepFilesToExclude="*.log"

set regexpengine=1
let g:easytags_async=1
let g:easytags_auto_highlight=0

" fix conflict betwen yank_stack & vim-suround (S block surrounding)
call yankstack#setup()

" vim-ruby features
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let s:rubycomplete_debug = 1

" ******************************* PLUGIN SETTINGS END ***************

" ******************************* KEY BINDINGS START ****************

nmap <Leader>n :NERDTreeToggle<CR>
map <leader>s :NERDTreeFind<cr>

"ctrl-p
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'

nmap <C-p> :CtrlPBuffer<CR>
nmap <F8> :TagbarToggle<CR>

let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
nmap <C-s> :YcmCompleter GoTo<CR>

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" maximize
nnoremap <Leader>m <C-W>\| <C-W>_

let g:yankstack_map_keys = 0
nmap <leader>k <Plug>yankstack_substitute_older_paste
nmap <leader>j <Plug>yankstack_substitute_newer_paste

" copy to X buffer
xmap <Leader>y "+Y 

" highlight word
nmap <C-H> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

nmap <Leader>l :CodiUpdate<CR>:w<CR>
nmap <Leader>l :w<CR>:SyntasticCheck<CR>
nmap <Leader>L :SyntasticReset<CR>

" some useless stuff
nmap <Leader>R :!ruby %<CR>
nmap <Leader>T :!rspec <CR>

nnoremap <CR> :noh<CR><CR>

" start interactive easyalign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start interactive easyalign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" *** async grep conf
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" generate ctags for all used gems
map <silent> <Leader>rt :!bundle list --paths=true \| xargs ctags --extra=+f --exclude=.git --exclude=log -R *<CR><CR> 

" ******************************* KEY BINDINGS END ******************
"
" ******************************* COLOR SCHEME START ****************

"indentline color
let g:indentLine_color_term = 239

let base16colorspace=256

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

" ******************************* COLOR SCHEME END ******************

