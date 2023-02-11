# YADRLite #

My 2023 Freedom Ladder Challenge:
---
Last year, I joined the [Free Software Foundation](https://www.fsf.org/)
and discovered the [Freedom Ladder](https://libreplanet.org/wiki/Group:Freedom_Ladder)
campaign. After looking at the parameters of the campaign, I felt I wasn't ready for
such a challenge at the time. I had some preparation work to do.

The goal of the campaign is to help people become aware of the difference between free
and nonfree software. Free doesn't mean "free", as in the sense of money. Free means
"freedom", where people have complete control of their software and the data stored in it.

Starting in January of 2023, I will be converting much of my proprietary software over
to free alternatives. The goal is to use as much free software as possible in my workflow.
By the end of the year I should be well aware if such a transformation was financially
viable or not. I've been in business for 15 years now. I've been in this industry for the
past 25 years. If there are any new revelations, I'm pretty sure they will be immediately
recognizable.

I'll be releasing a [blog](https://bridgesense.com) periodically about my progress. If
proprietary software sneaks in somewhere, I won't be hiding it. You'll know about that
too and why.

This repository is a collection of tools that I already use in my workflow. All references
to proprietary systems have been removed for the sake of this year's challenge. If you like
the idea and want to support me, the most important thing you could do is pass on my
[blog link](https://bridgesense.com) to your friends. A video series is also in the works.

Credit:
---
This dotfile repo is heavily based on [YADR](https://github.com/skwp/dotfiles)
which is a solid dotfile package created by Yan Pritzker and worked on by
several others.  This is not intended to be a fork of YADR.  At the same time,
I take no credit here either.  This is just a personal collection of settings
from YADR trimmed down considerably for the sake of speed and portability.

Check out the original repo, [YADR](https://github.com/skwp/dotfiles) especially
if you work in Python or Ruby.

index: [Emacs](#emacs), [Tmux](#tmux), and [Vim](#vim)

# Dotfiles Installation

Requirements: [git](https://git-scm.com/downloads)

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
curl https://raw.githubusercontent.com/bridgesense/dotfiles/master/emacs.d/emacs.init > ~/.emacs
```

#### To install my Ubuntu Mate workstation configuration [recommended for most]

```bash
curl https://raw.githubusercontent.com/bridgesense/dotfiles/master/workstation/ubuntu-mate-jammy > ~/install
```
Run as root...
```bash
bash install <username>
```
NOTE: Why use Ubuntu Mate over the standard Ubuntu distribution? I don't feel Wayland
is ready for professional use quite yet. Many applications still stumble over it. There
are a lot of tweaks needed to make things work only half as effecient as X11. Maybe in
after a few more years of development things will be different.

The Mate windows manager is much more efficient on system resources than Gnome is. Out of
the box, Ubuntu Mate will provide a much more familiar reference point to new users of Linux than
its Gnome counterpart.

#### To install my Trisquel 10 workstation configuration

```bash
curl https://raw.githubusercontent.com/bridgesense/dotfiles/master/workstation/trisquel-10 > ~/install
```
Run as root...
```bash
bash install <username>
```
IMPORTANT: If you have newer hardware, I would discourage the use of Trisquel.
What I've found that Trisquel runs very hot! Even with TLP and several other
plugins to assist with this, the problem persists. For newer hardware, I'd
encourage you to use the Ubuntu Mate distribution.

NOTE: This configuration script requires at least 32gb or more assigned to the
root partition. The graphical installation of Trisquel only assigns 20gb
or 5% of available disk space. You may want to use the text installation
instead to specify the size of the root partition.

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

Requirements: [Emacs 27.2+ w/ Lua support](https://www.gnu.org/software/emacs/)

Suggested: [Silver Searcher](https://github.com/ggreer/the_silver_searcher)

Emacs has a huge performance advantage over Vi.  This configuration includes
the [Evil](https://www.emacswiki.org/emacs/Evil) package which emulates Vim's
modal functionality.  In Evil mode Emacs shares keybindings familiar to the YADR
package.  Switching between Emacs and Evil mode is done by C-z. There is inline
documentation with live hints for ease of discovery.  After entering Emacs just
hit the leader key (,) to get started.  Hit the leader key twice for a fuzzy
command search.

NOTE: I have some personal concerns around Emacs 28's performance. Although,
I'm really excited about the new developments in 29. I would strongly suggest
to sticking with version 27 for now. If your distro doesn't have it, there are
compilation examples in each of the workstation scripts.

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
* `,e`: Toggle Error List
* `,h`: View Dashboard 
* `,jx`: Jump to character x
* `,m`: Browse current directory wth Ranger
* `,n`: Browse current directory with Nerdtree
* `,q`: Quit current buffer
* `:q`: or `:q!` Quit current buffer, Note: all standard VIM controls apply
* `,Q`: Close Emacs 
* `,x`: Cycle to next buffer
* `,z`: Cycle to previous buffer
* `,U`: Update All Packages
* `,/`: Search current project 

#### Emacs Applications:
* `,ai`: Open IRC
* `,at`: Open a terminal
* `,am`: Open Mu4e for Email
* `,aw`: Browse the web from Emacs

#### Buffer Shortcuts:
* `,bb`: List/Create buffers
* `,bc`: Copy File Path 
* `,bf`: Open File 
* `,bn`: Craete New Buffer 
* `,bp`: Find File in Project 
* `,bq`: Quit buffer
* `,br`: Refresh buffer
* `,bs`: Save buffer
* `:w`: Save buffer, VIM equivalent

#### Dap-Mode Shortcuts:
* `,da`: Delete all breakpoints 
* `,db`: Toggles breakpoint on current line
* `,dc`: Continue to next breakpoint 
* `,dd`: Start debugger
* `,di`: Step into
* `,dl`: List all breakpoints
* `,dn`: Next line 
* `,do`: Step out
* `,dp`: Install vscode-php-debug plugin
* `,dv`: View context
* `,dx`: Stop Debugger

#### Find:
* `,fd`: Find Definitions to hovered function
* `,fD`: Find in Current Buffer's Directory Recursively
* `,ff`: Resume Last Find 
* `,fi`: Find Implementation 
* `,fm`: Show quick menu of file definitions
* `,fp`: Find file in project 
* `,fr`: Find References to hovered function
* `,fs`: Find Documentation

#### Grammer Shortcuts:
* `,ga`: See Antonyms 
* `,gs`: View spelling errors
* `,gc`: Correct spelling of word under cursor
* `,gd`: See definition of word under cursor
* `,gd`: See related words for word under cursor
* `,gt`: See synonyms (thesaurus) of word under cursor

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
* `,p[`: Go to next change in file
* `,p]`: Go to previous change in file
* `,pd`: Search in directory
* `,ph`: History of buffer
* `,pf`: Fuzzy file finder (CtrlP)
* `,pp`: Resume previous search/filter
* `,pr`: Open recent project
* `,ps`: Search in current project
* `,pm`: Git status with Magit
* `,pw`: Swoop

#### Lisp Debugging Shortcuts:
* `,sa`: Evaluate statement
* `,sb`: Evaluate buffer
* `,sc`: Evaluate function
* `,se`: Evaluate and print statement
* `,sf`: Set breakpoint on function
* `,sl`: Load e-List file 
* `,sp`: Compile File
* `,ss`: Open Lisp scratch pad
* `,sv`: Set breakpoint on variable
* `,sw`: Remove breakpoint from a variable
* `,sx`: Remove breakpoint from a function

#### Emacs Toggle Options:
* `,tt`: Toggle Dark/Light Theme

#### Window Shortcuts:
* `,wd`: Delete current window
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

#### Other Shortcuts:
* `<ctrl>-z`: Toggles Emacs/Vim Mode
* `<ctrl>-x t`: Tab Controls

[Return to top](#yadrlite)

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
* `Ctrl-a Space`: Toggle all windows horizontally/vertically equally
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
* `:Git`: Git status with [Fugitive](https://github.com/tpope/vim-fugitive)
* `:Gclog`: view logs or load previous versions of same file
* `:Git push/pull`: repo management
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
* `:%!js-beautify`: run external comands on file within Vim, like js-beautify

#### Vim Dev:
* `,vc`: (Vim Command) copies the command under your cursor and executes it in
vim. Great for testing single line changes to vimrc.
* `,vr`: (Vim Reload) source current file as a vim file

[Return to top](#yadrlite)
