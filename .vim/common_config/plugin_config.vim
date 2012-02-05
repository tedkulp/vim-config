" Plugins are managed by Vundle. Once VIM is open run :BundleInstall to
" install plugins.

" Plugins requiring no additional configuration or keymaps
Bundle "YankRing.vim"
Bundle "L9"
Bundle "ddollar/nerdcommenter"
Bundle "kchmck/vim-coffee-script"
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
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "Lokaltog/vim-easymotion"
Bundle "Lokaltog/vim-powerline"

Bundle "majutsushi/tagbar"
  map <Leader>rt :TagbarToggle<cr>

Bundle "jeetsukumaran/vim-buffergator"
  " Remove the key binding and reset them by hand
  " (it inteferes with CtrlP)
  let g:buffergator_suppress_keymaps = 1
  let g:buffergator_autoexpand_on_split = 0
  map <Leader>b :BuffergatorToggle<cr>

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
  map <Leader>t :CtrlP<cr>
  map <Leader>m :CtrlPMRU<cr>

Bundle "mileszs/ack.vim"
  nmap g/ :Ack!<space>
  nmap g* :Ack! -w <C-R><C-W><space>

Bundle "tedkulp/jekyll.vim"
  let g:jekyll_path = "/Users/tedkulp/ruby/jekyll/_source"
  let g:jekyll_posts_path = "/Users/tedkulp/Dropbox/tedkulp.com/_posts"
  let g:jekyll_drafts_path = "/Users/tedkulp/Dropbox/tedkulp.com/_drafts"
  let g:jekyll_prompt_tags = "true"
  let g:jekyll_post_date = "true"

  map <Leader>jn  :JekyllPost<CR>
  map <Leader>jd  :JekyllDraft<CR>
  map <Leader>jl  :JekyllList<CR>

" ZoomWin to fullscreen a particular buffer without losing others
Bundle "vim-scripts/ZoomWin"
  map <Leader>z :ZoomWin<CR>
