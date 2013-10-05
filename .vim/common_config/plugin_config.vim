" Plugins are managed by Vundle. Once VIM is open run :BundleInstall to
" install plugins.

filetype off

" Plugins requiring no additional configuration or keymaps
Bundle "L9"
Bundle "ddollar/nerdcommenter"
Bundle "michaeljsmith/vim-indent-object"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-git"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-rvm"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-unimpaired"
Bundle "tsaleh/vim-matchit"
Bundle "kana/vim-textobj-user"
Bundle "kana/vim-textobj-function"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "thinca/vim-textobj-function-javascript"
Bundle "Lokaltog/vim-easymotion"
Bundle "Lokaltog/vim-powerline"
Bundle "altercation/vim-colors-solarized"
Bundle "godlygeek/tabular"
Bundle "jakar/vim-json"
Bundle "pangloss/vim-javascript"

" Snippets
Bundle "UltiSnips"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

Bundle "sjl/vitality.vim"
  let g:vitality_fix_focus = 0

Bundle 'benmills/vimux'
  " Run the current file with rspec
  map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>
  " Prompt for a command to run
  map <Leader>rp :PromptVimTmuxCommand<CR>
  " Run last command executed by RunVimTmuxCommand
  map <Leader>rl :RunLastVimTmuxCommand<CR>
  " Inspect runner pane
  map <Leader>ri :InspectVimTmuxRunner<CR>
  " Close all other tmux panes in current window
  map <Leader>rx :CloseVimTmuxPanes<CR>
  " Interrupt any command running in the runner pane
  map <Leader>rs :InterruptVimTmuxRunner<CR>

Bundle "kchmck/vim-coffee-script"
  au BufNewFile,BufRead *.coffee set filetype=coffee

Bundle "majutsushi/tagbar"
  map <Leader>t :TagbarToggle<cr>

Bundle "BufOnly.vim"
  map <Leader>Bo  :BufOnly<CR>

Bundle "ervandew/supertab"
  if !exists("g:SuperTabMappingForward")
    let g:SuperTabMappingForward = '<c-tab>'
  endif

  if !exists("g:SuperTabMappingBackward")
    let g:SuperTabMappingBackward = '<s-tab>'
  endif

  if !exists("g:SuperTabMappingTabLiteral")
    let g:SuperTabMappingTabLiteral = '<tab>'
  endif

Bundle "scrooloose/nerdtree"
  " let NERDTreeHijackNetrw = 0
  let NERDTreeShowHidden=1
  nmap gt :NERDTreeToggle<CR>
  nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>

  " Project Tree
  if exists("loaded_nerd_tree")
    autocmd FocusGained * call s:UpdateNERDTree()
    autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
    autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  endif

  " Close all open buffers on entering a window if the only
  " buffer that's left is the NERDTree buffer
  function s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
      if bufwinnr(t:NERDTreeBufName) != -1
        if winnr("$") == 1
          q
        endif
      endif
    endif
  endfunction

  " If the parameter is a directory, cd into it
  function s:CdIfDirectory(directory)
    let explicitDirectory = isdirectory(a:directory)
    let directory = explicitDirectory || empty(a:directory)

    if explicitDirectory
      exe "cd " . fnameescape(a:directory)
    endif

    " Allows reading from stdin
    " ex: git diff | mvim -R -
    if strlen(a:directory) == 0
      return
    endif

    if directory
      NERDTree
      wincmd p
      bd
    endif

    if explicitDirectory
      wincmd p
    endif
  endfunction

  " NERDTree utility function
  function s:UpdateNERDTree(...)
    let stay = 0

    if(exists("a:1"))
      let stay = a:1
    end

    if exists("t:NERDTreeBufName")
      let nr = bufwinnr(t:NERDTreeBufName)
      if nr != -1
        exe nr . "wincmd w"
        exe substitute(mapcheck("R"), "<CR>", "", "")
        if !stay
          wincmd p
        end
      endif
    endif
  endfunction

Bundle "tpope/vim-fugitive"
  map <leader>gb :Gblame<CR>
  map <leader>gs :Gstatus<CR>
  map <leader>gd :Gdiff<CR>
  map <leader>gl :Glog<CR>
  map <leader>gc :Gcommit<CR>
  map <leader>gp :Git push<CR>

Bundle "kien/ctrlp.vim"
  map <Leader>m :CtrlPMRU<cr>

Bundle "mileszs/ack.vim"
  nmap g/ :Ack!<space>
  nmap g* :Ack! -w <C-R><C-W><space>

" ZoomWin to fullscreen a particular buffer without losing others
Bundle "vim-scripts/ZoomWin"
  map <Leader>z :ZoomWin<CR>

" perform autoindenting based on filetype plugin
filetype plugin indent on
