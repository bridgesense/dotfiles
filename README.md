### NOTICE: My dotfiles are now being maintained at [https://gitlab.com/bridgesense/dotfiles](https://gitlab.com/bridgesense/dotfiles)

# YADRLite #

Credit:
---
This dotfile repo is heavily based on [YADR](https://github.com/skwp/dotfiles) which is a solid dotfile package created by Yan Pritzker and worked on by several others.  This is not intended to be a fork of YADR.  At the same time, I take no credit here either.  This is just a personal collection of settings from YADR trimmed down considerably for the sake of speed and portability.  

Check out the original repo, [YADR](https://github.com/skwp/dotfiles) especially if you work in Python or Ruby.


Installation:
---

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

#### On MacOS [Homebrew](https://brew.sh) has a nice [Cask](https://emacsformacosx.com) package for a GUI version of Emacs

```bash
brew cask install emacs
```

What's Included:
---
Shortcuts have been pulled over from YADR, so those working with YADR should feel right at home.  There are a few minor changes and additions.  A LOT may be missing.  This package will be gearing towards PHP development on local staging environments and setting up shop on web servers for emergencies where there may be limited permissions.  The idea is here that the package should be easy to remove while restoring the system to prior user configurations.

As with YADR, most of the key mapping can be found in the settings directory for reference.  More information may come later in offering examples on how to use YADRLite with [Xdebug](https://xdebug.org) and a few other tools.  This package is ready for deployment on MacOS and Linux distros. 

Vim:
---
![screenshot](https://www.bridgesense.com/static/images/dotfiles/vim.png)

Emacs:
---
![screenshot](https://www.bridgesense.com/static/images/dotfiles/emacs.png)

Emacs 24.4 or higher is preferred.
    
Emacs has a huge performance advantage over Vi.  This configuration includes the Evil package which emulates Vim's modal functionality.  In Evil mode Emacs shares keybindings familiar to the YADR package.  Switching between Emacs and Evil mode is done by C-z. There is inline documentation with live hints for ease of discovery.  After entering Emacs just hit the leader key (,) to get started.  Hit the leader key twice for a fuzzy command search.
    
