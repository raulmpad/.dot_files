" ---------------------------------------------------------
" 0 Command Help
" :verbose map <C-a> to check where a map is defined
" ---------------------------------------------------------

" ---------------------------------------------------------
" 1 Important
" ---------------------------------------------------------
set nocompatible
let mapleader=','
filetype on
filetype plugin on
filetype indent on

" --------------- neobundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shuogo/neobundle.vim'

" ---------------------------------------------------------
" 2 moving around, searching and patterns
" ---------------------------------------------------------
set incsearch
set smartcase

" ---------------------------------------------------------
" 3 tags
" ---------------------------------------------------------
nmap <Space><Leader> <C-]>

" ---------------------------------------------------------
" 4 displaying text
" ---------------------------------------------------------
set scroll=13
set nowrap
set nolinebreak
set fillchars=vert:\|,fold:-
" shows ^I,$ for tabs and end of line
" set list
set relativenumber
set number

" ---------------------------------------------------------
" 5 syntax, highlighting and spelling
" ---------------------------------------------------------
syntax enable
set cursorline

" ---------------------------------------------------------
" 6 multiple windows
" ---------------------------------------------------------

"set winminheight=20
"set winminwidth=50
set hidden
set splitright
map <C-x>1  <ESC>:BufOnly<CR>
" map <C-x>2  <ESC>:new<CR>
" map <C-x>3 <ESC>:vne<CR>
map <C-x>x <ESC>:hide<CR>
map <Leader>m <ESC>:bp<CR>
map <Leader>. <ESC>:bn<CR>
map <Leader>k <ESC>:Bdelete<CR>

map <Space>h <C-w>h
map <Space>j <C-w>j
map <Space>k <C-w>k
map <Space>l <C-w>l

" ---------------------------------------------------------
" 7 multiple tab pages
" ---------------------------------------------------------

" ---------------------------------------------------------
" 8 terminal
"  ---------------------------------------------------------
set term=xterm-256color
set t_Co=256
" Go to console
nnoremap <Leader><Leader>c <ESC>:sh<CR>

" ---------------------------------------------------------
" 9 using the mouse
" ---------------------------------------------------------
set ttymouse=xterm2

" ---------------------------------------------------------
" 10 printing
" ---------------------------------------------------------

" ---------------------------------------------------------
" 11 messages and info
" ---------------------------------------------------------
set showcmd
set showmode
" set verbosefile=~/vim/verbosefile.txt
" set verbose=10
set visualbell

" ---------------------------------------------------------
" 12 selecting text
" ---------------------------------------------------------
nmap <Space>p "*P
"set clipboard=unnamedplus


" ---------------------------------------------------------
" 13 editing text
" ---------------------------------------------------------
set undolevels=10000
set undoreload=12345
set backspace=indent,eol,start
" Indent whole buffer
map <Leader><Leader>i <ESC>gg=G<CR>
" kj to esc mode
inoremap kj <ESC>
" doubles line
nmap <Leader>d YP
" close all buffers
nmap <Leader><Leader>k :bufdo bdelete<CR>

" ---------------------------------------------------------
" 14 tabs and indenting
" ---------------------------------------------------------
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set expandtab
set autoindent
set smartindent
let g:html_indent_inctags = "html,body,head,tbody"


" ---------------------------------------------------------
" 15 folding
" ---------------------------------------------------------

" ---------------------------------------------------------
" 16 diff mode
" ---------------------------------------------------------

" ---------------------------------------------------------
" 17 mapping
" ---------------------------------------------------------
noremap <C-j> <C-n>
inoremap <C-k> <C-p>

" ---------------------------------------------------------
" 18 reading and writing files
" ---------------------------------------------------------
nmap <Esc><Esc> :w<CR>
vmap <Esc><Esc> <Esc><c-s>gv
imap <Esc><Esc> <Esc><Esc><Esc>
" map <C-o> <ESC>:Ex<CR>
noremap <Space>e <ESC>:Explore<CR>

" ---------------------------------------------------------
" 19 the swap file
" ---------------------------------------------------------
set noswf

" ---------------------------------------------------------
" 20 command line editing
" ---------------------------------------------------------
set history=50
set wildmenu
set wildmode=longest,list,full

" ---------------------------------------------------------
" 21 executing external commands
" ---------------------------------------------------------

" ---------------------------------------------------------
" 22 running make and jumping to errors
" ---------------------------------------------------------

" ---------------------------------------------------------
" 23 language specific
" ---------------------------------------------------------
autocmd BufRead,BufNewFile *.hamlc  set filetype=haml
autocmd BufRead,BufNewFile *.coffee set filetype=coffee

nmap <Space>rm :Rmodel<Space>
nmap <Space>rc :Rcontroller<Space>
nmap <Space>rv :Rview<Space>


" ---------------------------------------------------------
" 24 multi-byte characters
" ---------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8

" ---------------------------------------------------------
" 25 various
" ---------------------------------------------------------
" reload configuration
map <Leader><Leader>v :e $MYVIMRC<CR>
map <Leader><Leader>r :source $MYVIMRC<CR>
nmap <
" tries to autocomplete word with Tab
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" abrreviations
abbreviate soap saven_and_open_page<Space>



" ---------------------------------------------------------
" 26 NeoBundle
"
" May require previous NeoBundle manual installation
" ---------------------------------------------------------

" ------------- Airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1
set guifont=Iconsolata_for_Powerline:12
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
" ------------- Railscast
NeoBundle 'jpo/vim-railscasts-theme'
" ------------- NERDTree
NeoBundle 'scrooloose/nerdtree'
map <Space>n :NERDTreeToggle<CR>
" ------------- Ctrl-P
NeoBundle 'kien/ctrlp.vim'
nmap <C-a> :CtrlPBuffer<CR>
" ------------- Ag
NeoBundle 'rking/ag.vim'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -l --column --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_working_path_mode = 'ra'
" Own search mapping
nnoremap <C-f>f :Ag!<Space>
nnoremap <C-f>d :Ag! debugger<CR>
" bind to grep word under cursor
nnoremap <C-f>w :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
" ------------- BufOnly
NeoBundle 'duff/vim-bufonly'
" ------------- Colorschemes
NeoBundle 'flazz/vim-colorschemes'
" ------------- Syntastix
NeoBundle 'scrooloose/syntastic'
" ------------- Fugitive
NeoBundle 'tpope/vim-fugitive'
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>

" ------------- Vim-Rails
NeoBundle 'tpope/vim-rails'
" ------------- Vimshell
" NeoBundle 'Shuogo/vimshell'
" ------------- Tabularice
NeoBundle 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" ------------- CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'
" ------------- Vim-Ruby
NeoBundle 'vim-ruby/vim-ruby'
" ------------- Multiple-Cursors
NeoBundle 'terryma/vim-multiple-cursors'
" ------------- Unite
" NeoBundle 'Shougo/unite.vim'
" nnoremap <Space><Space> :Unite -start-insert file_rec/async<CR>
" nnoremap <C-a> :Unite buffer<CR>
" let g:unite_split_rule = 'botright'
" if executable('ag')
" let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".agignore" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
" let g:unite_source_rec_async_command='ag %s -l --column --nocolor -g ""'
" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
" let g:unite_source_grep_recursive_opt = ''
" endif
" ------------- Vimproc
NeoBundle 'Shougo/vimproc', { 'build' : { 'mac' : 'make -f make_mac.mak', }, }
" ------------- Vim-surround
NeoBundle 'tpope/vim-surround'
" ------------- Vim-repeat
NeoBundle 'tpope/vim-repeat'
" ------------- Vim-unimpaired
NeoBundle 'tpope/vim-unimpaired'
" ------------- Vim-commantary
NeoBundle 'tpope/vim-commentary'
nmap <Space>c gcc<CR>
vmap <Space>c gc<CR>
" ------------- EasyMotion
NeoBundle 'Lokaltog/vim-easymotion'
nmap <Space>s <Leader><Leader>s
" ------------- Expand selection
NeoBundle 'terryma/vim-expand-region'
" ------------ Unite-outline
NeoBundle 'h1mesuke/unite-outline'
map <Space>o <ESC>:Unite -start-insert outline<CR>
" ------------ Unite-vimfiler
NeoBundle 'Shougo/vimfiler.vim'
map <Space>f <ESC>:VimFiler<CR>
" ------------ shawncplus/skittles_berry
NeoBundle 'shawncplus/skittles_berry'
" ------------ Dispatcher
NeoBundle 'tpope/vim-dispatch'
" ------------ vim-rspec
NeoBundle 'thoughtbot/vim-rspec'
map <Leader>tt :call RunCurrentSpecFile()<CR>
map <Leader>ts :call RunNearestSpec()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>ta :call RunAllSpecs()<CR>
" let g:rspec_command = 'compiler rspec | set makeprg=zeus | Make rspec {spec}'
let g:rspec_runner  = 'os_x_iterm'
let g:rspec_command = ':Dispatch zeus rspec {spec}'
" ------------ moll/vim-bbye
NeoBundle 'moll/vim-bbye'
" ------------ tpope/vim-rvm
NeoBundle 'tpope/vim-rvm'
augroup rvm
  autocmd!
  autocmd BufEnter * Rvm
augroup END
" ------------ ngmy/vim-rubocop
NeoBundle 'ngmy/vim-rubocop'
let g:vimrubocop_config = '~/kantox-flow/rubocop.yml'
" ----------- mattn/emmet-vim
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Space>'
" ----------- tristen/vim-sparkup
NeoBundle 'tristen/vim-sparkup'
let g:sparkupNextMapping='<Leader>n'

NeoBundle 'jgdavey/tslime.vim'

" ----------- tyru - Github Integration
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tyru/open-browser-github.vim'
nmap <Leader><Leader>g :OpenGithubFile<CR>

NeoBundleCheck

" ---------------------------------------------------------
" MacVim
" ---------------------------------------------------------
" Arrow+Shift selection
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  " Own preferences
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  colorscheme obsidian2
  set guifont=Iconsolata\ for\ Powerline:14
else
  colorscheme sexy-railscasts-256
endif
