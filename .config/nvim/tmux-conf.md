set -g default-terminal 'screen-256coloret -g terminal-overrides ',xterm-256color:RGB'
# This is needed by the image.nvim plugin
set -g allow-passthrough on
# This is related to the `tmux_show_only_in_active_window = true,` config in image.nvim
set -g visual-activity off

# unbind r
# bind r source-file ~/.tmux.conf
set -g prefix C-s
set -g mouse on

set -g base-index 1
set -g renumber-windows on

bind r last-window
bind b previous-window

set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode when dragging with mouse

set -g detach-on-destroy off     # don't exit from tmux when closing a session
set -g escape-time 0             # zero-out escape time delay
set -g history-limit 1000000     # increase history size (from 2,000)
set -g set-clipboard on          # use system clipboard
set -g status-position top       # macOS / darwin style
set -g default-terminal "${TERM}"
# setw -g mode-keys vi
set -g pane-active-border-style 'fg=magenta,bg=default'
set -g pane-border-style 'fg=brightblack,bg=default'

set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
set -g @fzf-url-history-limit '2000'

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'fcsonline/tmux-thumbs'
set -g @plugin 'sainnhe/tmux-fzf'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'omerxx/catppuccin-tmux' 
set -g @plugin 'omerxx/tmux-sessionx'
set -g @plugin 'omerxx/tmux-floax'

set -g @floax-width '80%'
set -g @floax-height '80%'
set -g @floax-border-color 'magenta'
set -g @floax-text-color 'blue'
set -g @floax-bind 'p'
set -g @floax-change-path 'true'

set -g @sessionx-bind-zo-new-window 'ctrl-y'
set -g @sessionx-auto-accept 'off'
set -g @sessionx-custom-paths '/Users/tejaslimbikai/Developer'
set -g @sessionx-x-path '/Users/tejaslimbikai/Developer'
set -g @sessionx-bind 'o'
set -g @sessionx-window-height '85%'
set -g @sessionx-window-width '75%'
set -g @sessionx-zoxide-mode 'off'
set -g @sessionx-custom-paths-subdirectories 'false'
set -g @sessionx-filter-current 'false'
set -g @continuum-restore 'on'
set -g @resurrect-strategy-nvim 'session'

set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_number_position "right"
set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"
set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
set -g @catppuccin_status_modules_right "directory date_time"
set -g @catppuccin_status_modules_left "session"
set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator " "
set -g @catppuccin_status_right_separator_inverse "no"
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"
set -g @catppuccin_directory_text "#{b:pane_current_path}"
set -g @catppuccin_meetings_text "#($HOME/.config/tmux/scripts/cal.sh)"
set -g @catppuccin_date_time_text "%I:%M %p"

run '~/.tmux/plugins/tpm/tpm'

