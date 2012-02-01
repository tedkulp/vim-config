runtime! before_config/*.vim

" use gui tabs
set guioptions+=e

" kill the menubar
set guioptions-=T

" Add the bottom scrollbar
set guioptions+=b

" go full screen like you mean it
if has('mac')
  set fuoptions=maxvert,maxhorz
endif

" New font
set guifont=Inconsolata:h12

" pretty but not terminal-compatible color scheme
set background=dark
colors desert256

runtime! custom_config/*.gvim
