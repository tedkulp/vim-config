" Plugin stuff
set nocompatible

" Set leader to ,
let mapleader=","

" Syntax highlighting
syntax on

" Line numbers, please
set number

" Show the ruler at the bottom
set ruler rulerformat=%=%l/%L

" Default spacing stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" highlight trailing whitespace
set list listchars=tab:\ \ ,trail:·

" Status bar
set laststatus=2

" Searching
set hlsearch             " highlight the search matches
set incsearch            " show the first match as search strings are typed
set ignorecase smartcase " searching is case insensitive when all lowercase

" Use modeline overrides
set modeline
set modelines=10

" Show (partial) command in the status line
set showcmd

" set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" pick up external file modifications
set autoread

" don't abandon buffers when unloading
set hidden

" match indentation of previous line
set autoindent

" make backspace work in insert mode
set backspace=indent,eol,start

" have the mouse enabled all the time
set mouse=a

" use tab-complete to see a list of possiblities when entering commands
set wildmode=list:longest,full

" allow lots of tabs
set tabpagemax=20

" remember last position in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile} set ft=ruby

" JSON is JS
au BufNewFile,BufRead *.json set ai filetype=javascript

" augment status line
function! ETry(function, ...)
  if exists('*'.a:function)
    return call(a:function, a:000)
  else
    return ''
  endif
endfunction
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P
