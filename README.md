# Ted's custom vim config #

It's a work in progress. Below is a list of key bindings and notes.
The layout and some configurations are based on the [EdgeCase vim
configuration](https://github.com/edgecase/vim-config). I've pulled
the basic directory layout and Vundle setup, but kept most of my
plugin choices and keymaps.

Below is a list of plugin descriptions and keymap changes.

## Setup ##

1. `git clone git://github.com/tedkulp/vim-config.git`
2. `cd vim-config`
3. `sh setup.sh`
4. `vim`
5. `:BundleInstall`
6. Build CommandT (see CommandT section)

## Custom Shortcuts ##

* `c-h` Move left one window/buffer
* `c-j` Move down one window/buffer
* `c-k` Move up one window/buffer
* `c-l` Move right one window/buffer
* `s-up` Resize buffer one line higher
* `s-down` Resize buffer one line lower
* `s-left` Resize buffer one column smaller
* `s-right` Resize buffer one column bigger
* `<leader>-w` Enable word wrapping
* `<leader>-W` Disable word wrapping
* `<leader>-c` Remove trailing whitespace on whole file
* `<leader>-space` Remove search highlight
* `<leader>-I` Reindent entire file

## YankRing ##

Vim does not provide any mechanism to reference previous yanked, deleted
or changed text.  In Emacs this feature is called the "kill ring".

The YankRing plugin allows the user to configure the number of yanked,
deleted and changed text.  A split window can be used to choose which
element(s) from the yankring you wish to paste.  Alternately after
text has been pasted (using p), it can be replaced with a previous
value from the yankring with a single key stroke. You can learn more
about it with `:help yankring`.

**Cheatsheet**:

* `c-p` to move backwards through the ring
* `c-n` to move forwards through the ring
* `:YRShow` Show the current ring

## "Project Drawer" aka NERDTree ##

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
`:help NERDTree`.

**Cheatsheet**:

Use `m` on any selected file/dir to bring up a menu of file commands

**Customizations**:

Use `gt` to toggle NERDTree

## NERDCommenter ##

A plugin that allows for easy commenting of code for many filetypes.
Use `:help nerdcommenter`

**Cheatsheet**:

* `<leader>cc` - Comment out the current line or text selected in visual mode.
* `<leader>cn` - Same as <leader>cc but forces nesting.
* `<leader>c<space>` - Toggles the comment state of the selected line(s).
  If the topmost selected line is commented, all selected lines are uncommented
  and vice versa.
* `<leader>ci` - Toggles the comment state of the selected line(s) individually.
* `<leader>cs` - Comments out the selected lines "sexily"

There are lots more... look at the help

## Ack.vim ##

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack

**Customizations**:

`g/` to bring up `:Ack `.

## Repeat.vim ##

If you've ever tried using the `.` command after a plugin map, you were likely disappointed to discover it only repeated the last native command inside that map, rather than the map as a whole. That disappointment ends today. Repeat.vim remaps `.` in a way that plugins can tap into it.

The following plugins support repeat.vim:

* surround.vim _(installed)_
* abolish.vim _(installed)_
* unimpaired.vim _(installed)_
* speeddating.vim
* commentary.vim

## indent-object ##

Indent object creates a "text object" that is relative to the current
ident. Text objects work inside of visual mode, and with `c` (change),
`d` (delete) and `y` (yank). For instance, try going into a method in
normal mode, and type `v ii`. Then repeat `ii`.

**Cheatsheet**:

* `<count>ai` - (A)n (I)ndentation level and line above.
* `<count>ii` - (I)nner (I)ndentation level (no line above).
* `<count>aI` - (A)n (I)ndentation level and lines above/below.
* `<count>iI` - (I)nner (I)ndentation level (no lines above/below).

## text-object-ruby-block ##

When textobj-rubyblock is installed you will gain two new text objects,
which are triggered by `ar` and `ir` respectively. These follow Vim convention,
so that `ar` selects all of a ruby block, and `ir` selects the inner portion
of a rubyblock.

In ruby, a block is always closed with the end keyword. Ruby blocks may
be opened using one of several keywords, including module, class, def, if,
and do.

## Surround ##

Surround allows you to modify "surroundings" around the current text.
For instance, if the cursor was inside `"foo bar"`, you could type
`cs"'` to convert the text to `'foo bar'`.

There's a lot more; check it out at `:help surround`

**Cheatsheet**:

* `cs"'` - Change `"Hello World"` to `'Hello World'`
* `cs'<q>` - Change `'Hello World'` to `<q>Hello World</q>`
* `cst"` - Change `<q>Hello World</q>` to `"Hello World"`
* `ds"` - Remove delimiters from `"Hello World"`
* `ysiw]` - Makes `[Hello] World!` (w/ cursor on Hello -- iw is 'word' text object)
* `ds]` - Makes `Hello World!` (w/ cursor on Hello)
* `S(` - Visual mode -- wraps selected text in ( and )

## Command-T ##

Provides convenient ways to quickly reach the buffer or file you want.

* `<leader>t` - fuzzy find files
* `<leader>b` - fuzzy find open buffers
* `<C-s>` - open selected item in window in horizontal split
* `<C-v>` - open selected item in vertical split

**Building**:

Command-t uses a C module, so it has to be built. It's not too hard,
but does require build-essentials (on Ubuntu/Debian) or XCode to
compile correctly. No clue how to do it on Windows...

* `rvm use system` (if you have rvm setup)
* `cd ~/.vim/bundle/command-t/ruby/command-t`
* `ruby extconf.rb`
* `make`

## Fugitive ##

I'm not going to lie to you; fugitive.vim may very well be the best
Git wrapper of all time.  Check out these features:

View any blob, tree, commit, or tag in the repository with `:Gedit` (and
`:Gsplit`, `:Gvsplit`, `:Gtabedit`, ...).  Edit a file in the index and
write to it to stage the changes.  Use `:Gdiff` to bring up the staged
version of the file side by side with the working tree version and use
Vim's diff handling capabilities to stage a subset of the file's
changes.

Bring up the output of `git status` with `:Gstatus`.  Press `-` to
`add`/`reset` a file's changes, or `p` to `add`/`reset` `--patch` that
mofo.  And guess what `:Gcommit` does!

`:Gblame` brings up an interactive vertical split with `git blame`
output.  Press enter on a line to reblame the file as it stood in that
commit, or `o` to open that commit in a split.  When you're done, use
`:Gedit` in the historic buffer to go back to the work tree version.

`:Gmove` does a `git mv` on a file and simultaneously renames the
buffer.  `:Gremove` does a `git rm` on a file and simultaneously deletes
the buffer.

Use `:Ggrep` to search the work tree (or any arbitrary commit) with
`git grep`, skipping over that which is not tracked in the repository.
`:Glog` loads all previous revisions of a file into the quickfix list so
you can iterate over them and watch the file evolve!

`:Gread` is a variant of `git checkout -- filename` that operates on the
buffer rather than the filename.  This means you can use `u` to undo it
and you never get any warnings about the file changing outside Vim.
`:Gwrite` writes to both the work tree and index versions of a file,
making it like `git add` when called from a work tree file and like
`git checkout` when called from the index or a blob in history.

Use `:Gbrowse` to open the current file on GitHub, with optional line
range (try it in visual mode!).  If your current repository isn't on
GitHub, `git instaweb` will be spun up instead.

Add `%{fugitive#statusline()}` to `'statusline'` to get an indicator
with the current branch in (surprise!) your statusline.

Oh, and of course there's `:Git` for running any arbitrary command.

## ZoomWin ##

When working with split windows, ZoomWin lets you zoom into a window and
out again using `<C-W> o`

**Customizations**:

Binds `<leader>z` to `:ZoomWin`

## Supertab ##

Supertab aims to provide tab completion to satisfy all your insert completion
needs (:help ins-completion).

**Customizations**:

__(switch tab and c-tab)__
Binds `<tab>` to `g:SuperTabMappingTabLiteral`
Binds `<c-tab>` to `g:SuperTabMappingForward`

## Abolish ##

_(I just copied the whole README -- it's too hard to explain)_

This is a plugin over 3 years in the making that I've deferred releasing, primarily
because it's so gosh darn hard to explain.  It's three superficially unrelated
plugins in one that share a common theme: working with variants of a word.

### Abbreviation ###

I know how to spell separate.  I know how to spell desperate.  My fingers, however, have trouble
distinguishing between the two, and I invariably have a 50 percent chance of typing
seperate or desparate each time one of these comes up.  At first, I tried abbreviations:

    iabbrev  seperate  separate
    iabbrev desparate desperate

But this falls short at the beginning of a sentence.

    iabbrev  Seperate  Separate
    iabbrev Desparate Desperate

To be really thorough, we need uppercase too!

    iabbrev  SEPERATE  SEPARATE
    iabbrev DESPARATE DESPERATE

Oh, but consider the noun form, and the adverb form!

    iabbrev  seperation  separation
    iabbrev desparation desperation
    iabbrev  seperately  separately
    iabbrev desparately desperately
    iabbrev  Seperation  separation
    iabbrev Desparation Desperation
    iabbrev  Seperately  Separately
    iabbrev Desparately Desperately
    iabbrev  SEPERATION  SEPARATION
    iabbrev DESPARATION DESPERATION
    iabbrev  SEPERATELY  SEPARATELY
    iabbrev DESPARATELY DESPERATELY

Wait, there's also separates, separated, separating, separations, separator...

Abolish.vim provides a simpler way.  The following one command produces 48 abbreviations
including all of the above.

    Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}

My current configuration has 25 Abolish commands that create hundreds of corrections
my fingers refuse to learn.

### Substitution ###

One time I had an application that with a domain model called "facilities" that needed
to be renamed to "buildings". So, a simple search and replace, right?

    :%s/facility/building/g

Oh, but the case variants!

    :%s/Facility/Building/g
    :%s/FACILITY/BUILDING/g

Wait, the plural is more than "s" so we need to get that too!

    :%s/facilities/buildings/g
    :%s/Facilities/Buildings/g
    :%s/FACILITIES/BUILDINGS/g

Abolish.vim has your back.  One command to do all six, and you can repeat it with & too!

    :%Subvert/facilit{y,ies}/building{,s}/g

You can abbreviate it as :S, and it accepts the full range of flags including
things like c (confirm).

There's also a variant for searching and a variant for grepping.

### Coercion ###

Want to turn fooBar into foo_bar?  Press crs (coerce to snake_case).
MixedCase, camelCase, snake_case, and UPPER_CASE are all just 3 keystrokes
away.  These commands support repeat.vim.
