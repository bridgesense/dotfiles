# YADRLite #

Credit:
---
This dotfile repo is heavily based on [YADR] (https://github.com/skwp/dotfiles) which is a really solid dotfile package created by Yan Pritzker and worked on by several others.  This is not intended to be a fork of YADR.  At the same time, I take no credit here either.  This is just a personal collection of settings from YADR trimmed down considerably for the sake of speed and portability.  

Check out the original repo, [YADR] (https://github.com/skwp/dotfiles) especially if you work in Python or Ruby.


Installation:
---

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/bridgesense/dotfiles/master/setup`"
```

###Update:

```bash
bash ~/.yadrlite/setup update
```

###Uninstall and Restore to Prior Configuration:

```bash
bash ~/.yadrlite/setup remove
```


What's Included:
---
Shortcuts have been pulled over from YADR, so those working with YADR should feel right at home.  There are a few minor changes and additions.  A LOT may be missing.  This package will be gearing towards PHP development on local staging environments and setting up shop on web servers for emergencies where there may be limited permissions.  The idea is here that the package should be easy to remove while restoring the system to prior user configurations.

As with YADR, most of the key mapping can be found in the settings directory for reference.  More information may come later in offering examples on how to use YADRLite with [Xdebug] (https://xdebug.org) and a few other tools.  This package is ready for deployment on MacOS and Linux distros. 


Emacs:
---
Emacs has a huge performance advantage over Vi, although there is a time and place for every tool.  This is a custom brewed configuration of Emacs with influences from YADR, complete with familiar Vim keybindings.  Additionally, there is inline documentation with live hints for ease of discovery.  After entering Emacs just hit the leader key "," to get started.  Hit the leader key twice for a fuzzy command search.

NOTE: You might install an up-to-date GUI version of Emacs for clipboard sharing.  However, this setup file is compatible with the terminal version as well.  The first startup may take some time to load the additional packages.

    
###To install this Emacs configuration without the rest of YADRLite:
    
```bash
curl https://raw.githubusercontent.com/bridgesense/dotfiles/master/emacs.init > ~/.emacs    
```

###On MacOS [Homebrew](https://brew.sh) has a nice [Cask](https://caskroom.github.io) package for a GUI Emacs

```bash
brew cask install emacs-mac
```
