runtime! before_config/*.vim

" bring in the bundles for mac and windows
set rtp+=~/vimfiles/vundle.git/
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" pretty but not terminal-compatible color scheme
set background=dark
colors solarized

runtime! common_config/*.vim
runtime! custom_config/*.vim
