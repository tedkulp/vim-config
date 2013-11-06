" Plugins are managed by Vundle. Once VIM is open run :NeoBundleInstall to
" install plugins.

filetype off

" Plugins requiring no additional configuration or keymaps
NeoBundle "L9"
NeoBundle "ddollar/nerdcommenter"
NeoBundle "michaeljsmith/vim-indent-object"
NeoBundle "tpope/vim-abolish"
NeoBundle "tpope/vim-bundler"
NeoBundle "tpope/vim-cucumber"
NeoBundle "tpope/vim-endwise"
NeoBundle "tpope/vim-git"
NeoBundle "tpope/vim-markdown"
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-repeat"
NeoBundle "tpope/vim-rvm"
NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "tsaleh/vim-matchit"
NeoBundle "kana/vim-textobj-user"
NeoBundle "kana/vim-textobj-function"
NeoBundle "nelstrom/vim-textobj-rubyblock"
NeoBundle "thinca/vim-textobj-function-javascript"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "godlygeek/tabular"
NeoBundle "jakar/vim-json"
NeoBundle "pangloss/vim-javascript"

NeoBundle "bling/vim-airline"
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'

NeoBundle "sjl/vitality.vim"
  let g:vitality_fix_focus = 0

NeoBundle 'benmills/vimux'
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

NeoBundle "kchmck/vim-coffee-script"
  au BufNewFile,BufRead *.coffee set filetype=coffee

NeoBundle "majutsushi/tagbar"
  " map <Leader>t :TagbarToggle<cr>

NeoBundle "BufOnly.vim"
  map <Leader>Bo  :BufOnly<CR>

" Supertab completion
NeoBundle "ervandew/supertab"
  if !exists("g:SuperTabMappingForward")
    let g:SuperTabMappingForward = '<c-space>'
  endif

  if !exists("g:SuperTabMappingBackward")
    let g:SuperTabMappingBackward = '<s-space>'
  endif

  if !exists("g:SuperTabMappingTabLiteral")
    let g:SuperTabMappingTabLiteral = '<tab>'
  endif

" Snippets
NeoBundle "UltiSnips"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

NeoBundle "scrooloose/nerdtree"
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

NeoBundle "tpope/vim-fugitive"
  map <leader>gb :Gblame<CR>
  map <leader>gs :Gstatus<CR>
  map <leader>gd :Gdiff<CR>
  map <leader>gl :Glog<CR>
  map <leader>gc :Gcommit<CR>
  map <leader>gp :Git push<CR>

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle "Shougo/unite.vim"
  NeoBundle "Shougo/unite-outline"

  " Original config lifted from:
  " http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
  let g:unite_source_history_yank_enable = 1
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  nnoremap <leader>t  :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
  nnoremap <leader>f  :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
  nnoremap <leader>r  :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
  nnoremap <leader>o  :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
  nnoremap <leader>y  :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
  nnoremap <leader>be :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Play nice with supertab
    " let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  endfunction


NeoBundle "mileszs/ack.vim"
  nmap g/ :Ack!<space>
  nmap g* :Ack! -w <C-R><C-W><space>

" ZoomWin to fullscreen a particular buffer without losing others
NeoBundle "vim-scripts/ZoomWin"
  map <Leader>z :ZoomWin<CR>

" perform autoindenting based on filetype plugin
filetype plugin indent on
