#!/bin/sh
# Thanks to Seong Yong-ju @ https://github.com/sei40kr/tmux-airline-hybrid
main() {
  tmux set-option -g status 'on'
  tmux set-option -g status-utf8 'on'
  tmux set-option -g status-bg 'colour237'
  tmux set-option -g status-left-length '100'
  tmux set-option -g status-right-length '100'
  tmux set-option -g pane-active-border-fg 'colour8'
  tmux set-option -g pane-border-fg 'colour8'
  tmux set-option -g message-bg 'colour237'
  tmux set-option -g message-fg 'colour8'
  tmux set-option -g message-command-bg 'colour237'
  tmux set-option -g message-command-fg 'colour8'
  tmux set-option -g status-left '#[fg=colour8,bold] #S '
  tmux set-option -g status-right '#[fg=colour8,bg=colour237]⮂#[fg=colour235,bg=colour8] %Y-%m-%d %H:%M '
  tmux set-window-option -g window-status-fg 'colour8'
  tmux set-window-option -g window-status-activity-bg 'colour237'
  tmux set-window-option -g window-status-activity-fg 'colour8'
  tmux set-window-option -g window-status-separator ''
  tmux set-window-option -g window-status-bg 'colour237'
  tmux set-window-option -g window-status-format '#[fg=colour8,bg=colour237] #I #W '
  tmux set-window-option -g window-status-current-format \
    '#[fg=colour237,bg=colour239]⮀#[fg=colour8] #I ⮁ #W #[fg=colour239,bg=colour237]⮀'
}

main

# vim: set filetype=sh
