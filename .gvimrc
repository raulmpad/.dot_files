" Only for MacVim !!!

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  macmenu Edit.Find.Find\.\.\. key=<nop>
  map <D-f> /
endif
"
" gvim/macvim settings
"

set columns=100
set lines=40

"set clipboard=unnamed  " better integration with system clipboard

set antialias

set guioptions-=L   " hide scroll bars
set guioptions-=r   " "
set guioptions-=b   " "
set guioptions-=T   " hide toolbar
set guioptions-=m   " hide menu
set guioptions-=t   " no tearof menu entries in Win32

set antialias linespace=2

set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14

" open in full screen mode!
set fuoptions=maxvert,maxhorz
au GUIEnter * set fullscreen

" vim:foldenable:fdm=marker
