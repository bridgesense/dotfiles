#!/usr/bin/env bash
# Thanks to Seong Yong-ju @ https://github.com/sei40kr/tmux-airline-hybrid
main() {
  tmux set-option -g status 'on'
  tmux set-option -g status-utf8 'on'
  tmux set-option -g status-bg 'colour8'
  tmux set-option -g status-left-length '100'
  tmux set-option -g status-right-length '100'
  tmux set-option -g pane-active-border-fg 'colour235'
  tmux set-option -g pane-border-fg 'colour235'
  tmux set-option -g message-bg 'colour8'
  tmux set-option -g message-fg 'colour235'
  tmux set-option -g message-command-bg 'colour8'
  tmux set-option -g message-command-fg 'colour235'
  tmux set-option -g status-left '#[fg=colour235,bg=colour8,bold] #S '
  tmux set-option -g status-right '#[fg=colour228,bg=colour8]⮂#[fg=colour235,bg=colour228] %Y-%m-%d %H:%M '
  tmux set-window-option -g window-status-fg 'colour235'
  tmux set-window-option -g window-status-activity-bg 'colour8'
  tmux set-window-option -g window-status-activity-fg 'colour235'
  tmux set-window-option -g window-status-separator ''
  tmux set-window-option -g window-status-bg 'colour8'
  tmux set-window-option -g window-status-format '#[fg=colour235,bg=colour8] #I #W '
  tmux set-window-option -g window-status-current-format \
    '#[fg=colour8,bg=colour228]⮀#[fg=colour235] #I ⮁ #W #[fg=colour228,bg=colour8]⮀'
}

main

# vim: set filetype=sh
