"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Config root 
let nvimrc_dir = expand('<sfile>:h')
let dein_path = nvimrc_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(dein_path)
  execute "!git clone --depth=1 https://github.com/Shougo/dein.vim " . dein_path
endif

" Required:
let &runtimepath .= ',' . dein_path

" Required:
if dein#load_state(nvimrc_dir)
  call dein#begin(nvimrc_dir)

  " Let dein manage dein
  " Required:
  call dein#add(dein_path)

  " Add or remove your plugins here:
  " Shougo products
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/deoplete-clangx')
  call dein#add('Shougo/neoinclude.vim')

  " solarized color
  call dein#add('altercation/vim-colors-solarized')
  
  " NERDTree
  call dein#add('scrooloose/nerdtree')
  
  " color table 
  call dein#add('guns/xterm-color-table.vim')

  " reStructuredText
  call dein#add('Rykka/riv.vim')

  " markdown
  call dein#add('plasticboy/vim-markdown')

  " drawing
  call dein#add('vim-scripts/DrawIt')

  " airline
  call dein#add('vim-airline/vim-airline')

  " Tag view
  call dein#add('vim-scripts/L9')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('majutsushi/tagbar')

  " sudo
  call dein#add('vim-scripts/sudo.vim')

  " easy align
  call dein#add('junegunn/vim-easy-align')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark

" Enable xterm 256 settings
if has('nvim')
  set background=dark
  let g:solarized_termcolors=256
  colorscheme solarized
elseif &term=~# '^xterm'
  let &t_Co=256
  let &t_AF="\e[38;5;%dm"
  let &t_AB="\e[48;5;%dm"

  " Use solarized colorscheme
  set background=dark
  let g:solarized_termcolors=256
  colorscheme solarized
elseif has('gui_running')
  set background=dark
  colorscheme solarized
else
  set background=dark
  colorscheme desert
endif

if has('mouse')
  set mouse=a
endif

set number
set backspace=indent,eol,start
set history=500
set ruler
set showcmd
set so=7
set colorcolumn=80
map Q gq

" Tab setting
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" mapleader
let mapleader=","

" map ESC
inoremap <leader><leader> <Esc>

" Fast reloading for .vimrc
execute "map <silent> <leader>ee :e " . expand('<sfile>') . "<cr>"
execute "autocmd! bufwritepost " . expand('<sfile>:t') . " source " . expand('<sfile>:h')

" Recover from accidental Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" map ctrl+s to save.
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" listchar
set listchars=tab:>-,trail:-,eol:$

" encodings
set fileencodings=utf-8,cp936,gb18030,gbk,euc-jp,euc-kr,latin1
set encoding=utf-8
set fileformats=unix,dos

" cscope
if has("cscope")
  set csprg=cscope
  set csto=1
  set nocsverb
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

" Smart TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" denite
nnoremap <silent> <leader>b :<C-u>Denite buffer<cr>
nnoremap <silent> <leader>f :<C-u>Denite file_rec<cr>

" deol
nnoremap <silent> <leader>s :<C-u>Deol<cr>

" Taglist & Tagbar
let g:tagbar_ctags_bin='ctags'
let g:tagbar_left=1
nnoremap <silent> <F2> :TagbarToggle<CR>

" riv.vim
let g:riv_auto_fold1_lines = 1000
let g:riv_auto_fold2_lines = 1000
let g:riv_fold_auto_update = 1
let g:riv_auto_fold_force = 0
let g:riv_fold_level = 1
let g:riv_fold_blank = 1

" NERDTree
let g:NERDTreeWinPos="right"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <leader>t :NERDTreeFocus<CR>

" Powerline
set laststatus=2

" drawit
let g:drawit_mode='N'

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim:tw=78:ts=8:ft=vim:norl:noet:fen:
