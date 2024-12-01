set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set autoread
set number
set relativenumber
set diffopt+=vertical

let mapleader=" "
let maplocalleader="  "

set colorcolumn=99999

set backupdir=~/.vim/backup/

set foldmethod=indent
set foldlevelstart=99
set foldlevel=99

set showtabline=0

set fdo-=search
set fillchars=fold:\ 

set ignorecase
set smartcase
set hlsearch

set completeopt=menuone,noselect

filetype plugin on

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

source $HOME/.config/nvim/config/commands.vimrc

" bronson/vim-trailing-whitespace {{{
let g:extra_whitespace_ignored_filetypes = ['sql', 'dbout']
" }}}
" w0rp/ale ---- {{{
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \   'cpp': [],
      \}
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop', 'reek'],
      \   'cpp': [],
      \}

let g:ale_virtualtext_cursor = 'dsabled'

" Broke after packer->lazy
"let g:ale_sign_error = emoji#for('broken_heart')
"let g:ale_sign_warning = emoji#for('fire')
let g:ale_set_highlights = 0
highlight link ALEWarningSign todo
highlight link ALEErrorSign todo
" }}}
" airblade/vim-gitgutter ---{{{
set signcolumn=yes
"set updatetime=100
" }}}
" bling/vim-airline' {{{
set laststatus=2
" autozimu/LanguageClient-neovim {{{
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio']
    "\ 'ruby': ['ruby-lsp']
    \ }
" }}}
" vim-scropts/vim-autosave {{{
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1
"}}}
" embear/vim-localvimrc {{{
let g:localvimrc_ask = 0
"}}}
" rickhowe/diffchar.vim {{{
let g:DiffColors = 100
"}}}
"plasticboy/vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
"}}}
" justinmk/vim-dirvish {{{
let g:dirvish_mode = ':sort ,^.*[\/],'
" }}}
" machakann/vim-highlightedyank {{{
let g:highlightedyank_highlight_duration = 150
"}}}

" wincent/ferret {{{
let g:FerretAutojump=2
let g:FerretExecutable='ag,rg'
"}}}
" wincent/scalpel {{{
let g:ScalpelMap=0
" }}}
" jiangmiao/auto-pairs {{{
let g:AutoPairsShortcutToggle = ""
"}}}

set termguicolors
highlight Comment cterm=italic
set background=dark

highlight link CompeDocumentation NormalFloat


" never used them
nmap Q q

" shell mappings in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" windows/tabs navigation {{{
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
" }}}

lua require('plugins')
lua require('justed')

"colorscheme nightfox

nnoremap <A-m> :cnext <cr>zz
nnoremap <A-,> :cprev <cr>zz

nnoremap H :call mappings#cycle_highlight() <CR>

nnoremap <silent> <c-k> <plug>(ale_previous_wrap)
nnoremap <silent> <c-j> <plug>(ale_next_wrap)

xnoremap <Leader>yy "+y
nmap <leader>yn :let @"=expand("%:t")<CR>
nmap <leader>yp :let @"=expand("%")<CR>

nnoremap <leader>p <cmd>Telescope find_files<cr>

nnoremap <F4> :lua package.loaded.justed = nil<CR>:lua package.loaded.justed_compe = nil<CR>:source ~/.config/nvim/init.vim<CR>:LocalVimRC<CR>

nnoremap <leader>w :write<CR>

nnoremap <leader>ww :e scratch/index.md<CR>
nnoremap <Leader>gla :GV<cr> 
nnoremap <Leader>glf :GV!<cr>
nnoremap <leader>gs :G<cr>
nnoremap <Leader>gb :GBrowse<cr>
nnoremap <Leader>dd :tabe<cr>:DBUI<cr>
nnoremap <Leader>rr :RnvimrToggle<cr>
nnoremap <Leader>hh :Http<cr>

nnoremap <leader>s :Telescope grep_string searc=<C-R><C-W><CR>

xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

nnoremap <silent> gd :Telescope lsp_definitions<CR>
nnoremap <silent> gr :Telescope lsp_references<CR>

inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-jump-next' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" like a shell cmd mode navigation
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" Y works like C & D
nnoremap Y y$

" always center the match
nnoremap n nzzzv
nnoremap N Nzzzv

" More undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Git
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>ge :Gedit %<cr>
nnoremap <Leader>gE :Gedit origin/master:%<cr>
nnoremap <Leader>gj :VcsJump diff HEAD<cr>
nnoremap <Leader>ga :Git blame<cr>

nnoremap <silent><Leader>ma :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent><Leader>nh :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent><A-y> :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent><A-u> :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent><A-i> :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent><A-o> :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <silent><A-p> :lua require("harpoon.ui").nav_file(5)<cr>

" Always refresh indentlines after folding
nmap <silent>zo zo:IndentBlanklineRefresh<cr>
nmap <silent>zO zO:IndentBlanklineRefresh<cr>
nmap <silent>zc zc:IndentBlanklineRefresh<cr>
nmap <silent>zC zC:IndentBlanklineRefresh<cr>
nmap <silent>zm zm:IndentBlanklineRefresh<cr>
nmap <silent>zM zM:IndentBlanklineRefresh<cr>
nmap <silent>zr zr:IndentBlanklineRefresh<cr>
nmap <silent>zR zR:IndentBlanklineRefresh<cr>

let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
  call setreg(r, [])
endfor


function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.jrnl set syntax=markdown
augroup END

" airblade/vim-gitgutter
set updatetime=100

" proper cursor highlighting
highlight Cursor guifg=white guibg=red
highlight iCursor guifg=white guibg=red
highlight nCursor guifg=white guibg=red
set guicursor=n-c-v:block-nCursor-blinkon999-blinkoff1-blinkwait1
set guicursor+=i:ver100-iCursor

let g:hardtime_default_on = 0
