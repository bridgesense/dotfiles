# YADRLite #

Credit:
---
This dotfile repo is heavily based on [YADR](https://github.com/skwp/dotfiles)
which is a solid dotfile package created by Yan Pritzker and worked on by
several others.  This is not intended to be a fork of YADR.  At the same time,
I take no credit here either.  This is just a personal collection of settings
from YADR trimmed down considerably for the sake of speed and portability.

Check out the original repo, [YADR](https://github.com/skwp/dotfiles) especially
if you work in Python or Ruby.

index: [Emacs](#emacs), [Tmux](#tmux), [Vim](#vim), and [Kitty](#kitty)

# Dotfiles Installation

Requirements: [git](https://git-scm.com/downloads),
[Homebrew](https://brew.sh)(for MacOS)

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/bridgesense/dotfiles/master/setup`"
```

#### Update:

```bash
bash ~/.yadrlite/setup update
```

#### Uninstall and Restore to Prior Configuration:

```bash
bash ~/.yadrlite/setup remove
```

#### To install this Emacs configuration without the rest of YADRLite:

```bash
curl https://raw.githubusercontent.com/bridgesense/dotfiles/master/emacs.init > ~/.emacs
```

#### On MacOS [Homebrew](https://brew.sh) has a nice
[Cask](https://emacsformacosx.com) package for a GUI version of Emacs

```bash
brew cask install emacs
```

What's Included:
---
Shortcuts have been pulled over from YADR, so those working with YADR should
feel right at home.  There are a few minor changes and additions.  A LOT may
be missing.  This package is geared towards PHP development on local staging
environments and setting up shop on web servers for emergencies where there may
be limited permissions.  The idea is here that the package should be easy to
remove while restoring the system to prior user configurations.

As with YADR, most of the key mapping not mentioned below can be found in the
settings directory for reference.  This package is ready for deployment on most
Linux distros and MacOS.

__Vim / Tmux__\
![screenshot](https://www.bridgesense.com/images/dotfiles/vim-style.jpg)

__Emacs__\
![screenshot](https://www.bridgesense.com/images/dotfiles/emacs-style.jpg)

# Emacs

Requirements: [Emacs 24.4+ w/ Lua support](https://www.gnu.org/software/emacs/)

Suggested: [Silver Searcher](https://github.com/ggreer/the_silver_searcher)

Emacs has a huge performance advantage over Vi.  This configuration includes
the [Evil](https://www.emacswiki.org/emacs/Evil) package which emulates Vim's
modal functionality.  In Evil mode Emacs shares keybindings familiar to the YADR
package.  Switching between Emacs and Evil mode is done by C-z. There is inline
documentation with live hints for ease of discovery.  After entering Emacs just
hit the leader key (,) to get started.  Hit the leader key twice for a fuzzy
command search.

[Return to top](#yadrlite)

Emacs Shortcuts
---
The [General](https://github.com/noctuid/general.el) plugin has been included
with this Emacs configuration. There is no need to hold the comma down (the
leader key borrowed from YADR) before pressing the next key. The following
shortcuts can be typed concurrantly in the order presented which is a nice
alternative to the Emacs Pinky.

#### Single Key Shortcuts:
* `,,`: Search for a command, M-X equivalent
* `,;`: Comment or uncomment code blocks
* `,[`: Contract vertically split Window
* `,]`: Expand vertically split Window
* `,-`: Shrink horizontally split window
* `,=`: Grow hoizontally split window
* `,a`: Search project
* `,d`: Open directory browser, Ranger equivalent
* `,e`: Toggle Error List
* `,jx`: Jump to character x
* `,n`: Browse current directory, Nerdtree equivalent
* `,q`: Kill current buffer
* `:q`: or `:q!` Kill current buffer, Note: all standard VIM controls apply
* `,Q`: Quit Emacs
* `,x`: Cycle to next buffer
* `,z`: Cycle to previous buffer

#### Buffer Shortcuts:
* `,bb`: List/Create buffers
* `,bs`: Save buffer
* `:w`: Save buffer, VIM equivalent
* `,br`: Refresh buffer

#### Window Shortcuts:
* `,wd`: Dem/settings lete windown
* `,wc`: Delete all other windows except current window
* `,wf`: Toggle Emacs full screen
* `,wh`: Focus on window to left of current one
* `,wj`: Focus on window above current one
* `,wk`: Focus on window below current one
* `,wl`: Focus on window to right of current one
* `,wH`: Move current window left
* `,wJ`: Move current window up
* `,wK`: Move current window down
* `,wL`: Move current window right
* `,wn`: Switch screens
* `,wo`: Focus on next window
* `,wp`: Pop out current window to new screen
* `,ws`: Split window horizontally
* `,wv`: Split window vertically
* `,wx`: Close screen

#### Emacs Applications:
* `,ai`: Open IRC
* `,at`: Open a terminal
* `,am`: Open Gnus for News/Email
* `,ap`: Open a PHP scratch pad or interactive shell, requires Boris
* `,aw`: Browse the web from Emacs

#### Geben (Xdebug) Shortcuts:
* `,gb`: Add Breakpoint to current line
* `,gc`: Clear all breakpoints
* `,gm`: Setup path mapping ([see explanation](https://gitlab.com/bridgesense/lampready#emacs-geben-settings))
* `,go`: Start Geben
* `,gr`: Continue to breakpoint
* `,gv`: View context
* `,gx`: Stop Geben

#### Line Shortcuts:
* `,la`: Artist mode, draw on screen with cursor
* `,lc`: Toggle HTML color codes
* `,le`: Encrypt selection
* `,ld`: Decrypt selection
* `,li`: Toggle aggressive indentation
* `,ln`: Toggle line numbers
* `,lm`: Toggle Line/Character mode
* `,lr`: Toggle relative line number display
* `,ls`: Delete trailing whitespaces
* `,lt`: Toggle PHP/Web mode highlighting
* `,lw`: Toggle line wrapping

#### Emacs Display Options:
* `,Ot`: Toggle Dark/Light Theme

#### Org-Mode Shortcuts:
* `,oo`: Agenda View, be sure to adjust position wth org-agenda-file-to-front
* `,oa`: Activate current line
* `,od`: Schedule deadline
* `,oc`: Recompute clock
* `,ok`: Schedule task
* `,og`: Set tag
* `,ol`: Display clocks
* `,oj`: Jump to running task
* `,ot`: Start task
* `,or`: Show report
* `,os`: Stop task
* `,ox`: Cancel clock

#### Project Shortcuts:
* `,pd`: Search in directory
* `,ph`: History of buffer
* `,pf`: Fuzzy file finder (CtrlP)
* `,pP`: Open recent project
* `,pp`: Resume previous search/filter
* `,ps`: Search in current project
* `,pm`: Git status with Magit
* `,pw`: Swoop

#### Word Shortcuts:
* `,Ws`: View spelling errors
* `,Wc`: Correct spelling of word under cursor
* `,Wd`: See definition of word under cursor
* `,Wt`: See synonyms (thesaurus) of word under cursor
* `,Wa`: See antonyms of word under cursor

# Tmux

Requirements: [Tmux](https://github.com/tmux/tmux/wiki/Installing)

[Return to top](#yadrlite)

Tmux Shortcuts
---
The leader key Ctrl-a can be followed by the next key concurrently without
holding them all down at once.  Use `tmux ls`to list the current open sessions
and `tmux a -t <session_no>` to join them.  Use
`tmux kill-session -t <session_no>`: to remove one.

#### General Shortcuts:
* `Ctrl-a d`: Detach from current session and close Tmux.  Run `tmux attach`:
to resume later.
* `Ctrl-a h`: Focus on window left of the current one
* `Ctrl-a j`: Focus on window above the current one
* `Ctrl-a k`: Focus on window below the current one
* `Ctrl-a l`: Focus on window right of the current one
* `Ctrl-a x`: Kill current window pane
* `Ctrl-a H`: Shift current window pane left
* `Ctrl-a J`: Shift current window pane down
* `Ctrl-a K`: Shift current window pane up
* `Ctrl-a L`: Shift current window pane right
* `Ctrl-a s`: Create new window horizontally below current one
* `Ctrl-a v`: Create new window vertically to right of current one
* `Ctrl-a [`: Enter Vim-like normal mode
* `Ctrl-a Ctrl-s`, `Ctrl-r`: Saves and Restores Tmux Session

In visual mode use `h,j,k,l` to move, `v` to change to visual mode and `y` to
yank selection.  Press `Enter` to exit mode.


# Vim

This configuration uses [Vim-Plug](https://github.com/junegunn/vim-plug).  To
initialize the plugins, enter Normal mode and type `:PlugInstall`.  Similarly,
you use `:PlugUpdate` to update your plugins.

Requirements: [Vim w/ Lua support](https://www.vim.org)

Plugin Requirements: [Composer](https://getcomposer.org/),
[neovim](https://neovim.io/), [nodejs](https://nodejs.org/),
[Python 3+](https://www.python.org), [Pynvim](https://github.com/neovim/pynvim),
[Silver Searcher](https://github.com/ggreer/the_silver_searcher)

[Return to top](#yadrlite)

Vim Shortcuts
---
#### Window Navigation:
* `Cmd-[1-]`: (`Alt-[1-9]`) switches to a specific tab number (like iTerm and
Chrome) and tabs have been set up to show numbers
* `Ctrl-h,l,j,k`: to move left, right, down, up between splits. This also works
between vim and tmux splits thanks to `vim-tmux-navigator`.
* `Ctrl-w r`: rotate windows around
* `vv`: vertical split (`Ctrl-w,v`)
* `ss`: horizontal split (`Ctrl-w,s`)
* `,c`: closes window only (`Ctrl-w,c`)
* `,qo`: open quickfix window (this is where output from Grep goes)
* `,qc`: close quickfix
* `Cmd-[Up,Down,Left,Right]`: (`Alt-[Up,Down,Left,Right]`) increase hight,
decrease height, contract window and expand window
* `=`: make all windows equal size

#### Tab Navigation
* `Cmd-c`: (`Alt-c`) create new tab
* `Cmd-q`: (`Alt-q`) close tab and hide buffers
* `Cmd-z`: (`Alt-z`) go to previous tab
* `Cmd-x`: (`Alt-x`) go to next tab
* `Cmd-[1-9]`: (`Alt-[1-9]`) select tab by number

#### Buffer/File Navigation:
* `,z`: cycle back through previously opened buffers
* `,x`: cycle forward through previously accessed buffers
* `,TAB`: toggle between last two opened buffers
* `,b`: CtrlP buffer selector great for jumping to a file you already have open
* `,,b`: opens buffer selector containing recently opened files
* `,n`: opens file explorer in directory vim was started in
* `,m`: shows current file in file explorer
* `,q`: closes buffer (`:bd!`)
* `,Q`: completely closes Vim without saving any buffers (`:qa!`)
* `,Z`: completely closes Vim saving all buffers (`:xa`)
* `,S`: saves all buffers (`:wa`)

#### Code/Search Navigation:
* `Ctrl-o`: Old cursor position this is a standard mapping but very useful, so
included here
* `Ctrl-i`: opposite of Ctrl-O (again, this is standard)
* `,gf`: same as vim normal gf (go to file)
* `,ag`: Grep command line using Silver Searcher and Fzf
* `,ad`: search for term in directory of current file
* `,aw`: Search the current word under the cursor
* `,hl`: toggle search highlight on and off
* `Ctrl-x Ctrl-o`: vim omnicompletion
* `//`: clear the search
* `,mc`: mark this word for MultiCursor (like sublime). Use `Ctrl-n`: (next),
`Ctrl-p`: (prev), `Ctrl-x`(skip) to add more cursors, then do normal vim things
like edit the word.
* `,jx`: EasyMotion Jump to character x
* Spacebar Sneak type two characters to move there in a line. Kind of like vim's
`f`: but more accurate.
* `:Gsearch foo`: global search, then do your normal `%s/search/replace/g` and
follow up with `:Greplace` to replace across all files. When done use `:wall`:
to write all the files.

#### Git Plugin:
* `:GStatus`: Git status with [Fugitive](https://github.com/tpope/vim-fugitive)
* `:GLog`,`:Glog -- %`,`:0Glog`: view logs or load previous versions of same file
* `:Git push/pull`: repo management
* `:Gpush/pull`: repo management
* `]c`, `[c`: jump to next/previous modification

#### Ctag Management:
* `:MakeTags`: build tag library for project
* `,gt`: search for tag under cursor and bring up file
* `,gi`: go to next tag in history
* `,go`: go back one tag in history

### Spell Check:
* `,W`: Toggle spell checker
* `]s`,`[s`: jump to next/previous spelling error
* `z=`: get spelling suggestion
* `zg`, `zug`: add/remove word from spellfile

#### Conquer of Completion:
* `gd`: go to tag definition
* `gy`: go to type definition
* `gi`: go to next implementation of tag
* `gr`: pull up reference preview of tag
* `,rn`: symbol renaming
* `,f`: format selected code
* `:Format`: format code in current buffer
* `:Fold`: fold code in current buffer
* `:OR`: organizes imports of current buffer
* `:Ctrl-f`: scroll up in popup window `:Ctrl-b`: scroll down in popup window
* `,e`: pull up diagnostic window
* `[g`,`]g`: navigate up/down diagnostic window
* `,qf`: autocorrect line error
* `H`,`K` : pull up documentation for item under cursor
* `Ctrl-Space`: Trigger autocompletion

### Snippets:
* `C-l`: Trigger snippet expand
* `C-j`: Expand or Jump to next placeholder
* `C-k`: Jump to previous placeholder
* `,x`: Convert visual selected code to a snippet
* `<tab>`: triggers completion, confirmation, expand and jump

#### Asynchronous Recorder:
* `q <letter>`: start recording all activity
* `q`: stop recording
* `@ <letter>`: replay activity stored in letter

#### Handy Autocompletions:
* `Ctrl-x Ctrl-n`: multiword/tag completion
* `Ctrl-x Ctrl-f`: filename completion
* `Ctrl-x Ctrl-o`: omnicompletion

#### Xdebug
See more about setting up the
[.vimrc.local](https://gitlab.com/bridgesense/lampready#vim-vdebug-settings) file.
* `<F5>`: start/run (to next breakpoint/end of script)
* `<F2>`: step over
* `<F3>`: step into
* `<F4>`: step out
* `<F6>`: stop debugging (kills script)
* `<F7>`: detach script from debugger
* `<F9>`: run to cursor
* `<F10>`: toggle line breakpoint
* `<F11>`: show context variables (e.g. after "eval")
* `<F12>`: evaluate variable under cursor
* `:Breakpoint <type> <args>`: set a breakpoint of any type (see :help VdebugBreakpoints)
* `:BreakpointRemove *`: remove all breakpoints
* `:VdebugEval <code>`: evaluate some code and display the result
* `,e`: evaluate the expression under visual highlight and display the
  result

#### Better keystrokes for common editing commands:
* `S#` `S"` `S'` `S]` `S)` `S}`: to surround a visual selection with these
common wrappers
* `ci'`, `ci"`, `ci]`, `ci)`: (`Alt` Linux) changes content inside those
surrounding marks. You don't have to be inside them
* `,.`: to go to last edit location (same as `'.`) because the apostrophe is
hard on the pinky
* `,ci`: to change inside any set of quotes/brackets/etc

#### Misc:
* `,,c`: search for and execute commands
* `Ctrl-p`: after pasting Use `p`: to paste and `Ctrl-p`: to cycle through
previous pastes.
* `,yw`: yank a word from anywhere within the word (so you don't have to go to
the beginning of it)
* `,ow`: overwrite a word with whatever is in your yank buffer you can be
anywhere on the word. saves having to visually select it
* `,w`: strip trailing whitespaces
* `,hi`: show current Highlight group. if you don't like the color of something,
use this, then use `hi! link [groupname] [anothergroupname]`: in your
vimrc.after to remap the color. You can see available colors using `:hi`
* `:Wrap`: wrap long lines (e.g. when editing markdown files)
* `,;;`, `gcc`: un/comment selected lines in visual mode thanks to [tComment](https://github.com/tomtom/tcomment_vim)
* `,o`,`,p`: start a new or restore an existing Vim session thanks to [obsession](https://github.com/tpope/vim-obsession)
* `zf`,`zo`,`zc`,`za`,`zr`,`zm`,`zd`: creates, opens, closes, toggles, toggles
all, collapses all and deletes code folds
* `,W`,`z=`,`]s`,`[s`: toggle spell check, word suggestion and jump
forward/backward to next misspelled word

#### Vim Dev:
* `,vc`: (Vim Command) copies the command under your cursor and executes it in
vim. Great for testing single line changes to vimrc.
* `,vr`: (Vim Reload) source current file as a vim file


# Kitty

Kitty is a full featured GPU-accelerated terminal.  It's faster.

Requirements: [Kitty](https://sw.kovidgoyal.net/kitty/)

[Return to top](#yadrlite)

Kitty Shortcuts
---
#### History:
* `Ctrl+Shift+h` Enter history
* `Ctrl+Shift+p, v` Enter history in VIM mode

#### Tabs:
* `ctrl+shift+t`: Creates new tab
* `ctrl+shift+q`: Closes tab
* `ctrl+shift+right`: Next tab
* `ctrl+shift+left`: Last tab
* `ctrl+shift+.`: Move tab forward
* `ctrl+shift+,`: Move tab backward

#### Windows:
* `ctrl+shift+enter`: New window
* `ctrl+shift+w`: Close window
* `ctrl+shift+n`: Create new OS window
* `ctrl+shift+]`: Next window
* `ctrl+shift+[`: Last window
* `ctrl+shift+l`: Cycle through layout
* `ctrl+shift+f`: Shift window to prominent spot
* `ctrl+shift+b`: Shift window to least prominent spot
* `ctrl+shift+F2`: Create a new iteration of the last edited window

#### Display Options:
* `Ctrl+Shift+Equal`: Inscrease Font Size
* `Ctrl+Shift+minus`: Decrease Font Size
* `Ctrl+Shift+backspace`: Restore Font Size
