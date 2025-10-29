{
	config = ''
unbind-key C-b
set-option -g prefix m-x
bind-key M-x send-prefix
set -g allow-passthrough on
set -ga update-environment TERM
set -ga update-environment TERM_PROGRAM

# no annoying
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none

set-option -g default-terminal "tmux-256color"
setw -g clock-mode-colour "#fab387"
setw -g mode-style 'fg=#181825 bg=#f38ba8'

set -g status-position bottom
set -g status-justify left
set -g status-style 'fg=#f38ba8'

set -g status-left " Tmux "
set -g status-left-style ",bold"
set -g status-left-length 10

set -g status-right '  #(date "+%Y-%m-%d %H:%M") │  #{pane_current_command} │  #{pane_index}:#{pane_id} '
set -g status-right-style 'fg=#181825 bg=#fab387'
set -g status-right-length 50


setw -g window-status-style 'fg=#a6adc8 bg=#313244, bold'
setw -g window-status-format ' #I #W #{?window_active, ,󰝾} '
setw -g window-status-current-style 'fg=#181825 bg=#f38ba8, bold'
setw -g window-status-current-format ' #I #W #{?window_flags,,} '

setw -g window-status-bell-style 'fg=#fab387 bg=#f38ba8, bold'
set -g message-style 'fg=#181825 bg=#f38ba8, bold'


set -sg escape-time 5

set-option -g mouse off
#set-option -g status-style fg=white,bg=#333349

set -g base-index 1
setw -g pane-base-index 1

#set -g window-active-style 'fg=terminal,bg=terminal'
#set -g window-style 'fg=terminal,bg=terminal'

set focus-events on
set-hook -g client-focus-in "set window-active-style 'fg=terminal,bg=terminal'"
set-hook -g client-focus-out "set window-active-style 'fg=terminal,bg=#181825'"

set -g pane-border-style 'fg=#45475a,bg=terminal' 
set -g pane-active-border-style 'fg=#f2cdcd,bg=terminal'

#set -g status-right-length 27
#set -g status-right '#[fg=black]• #[fg=blue,bright]#(echo "$(pwd | string shorten -m25 --left)  ")#[default]'

run-shell -b 'tmux rename-window PRIME'
# run-shell 'tmux rename-window $(shuf -n1 /usr/share/dict/british-english)'
# set-hook -g server-start 'run-shell "tmux rename-window prime"'

# INFO: bad idea
# set-hook -g after-new-window 'run-shell "tmux rename-window $(shuf -n1 /usr/share/dict/british-english)"'

set-option -g allow-rename on

bind -n M-a select-pane -L   # Alt+a
bind -n M-d select-pane -R   # Alt+d
bind -n M-w select-pane -U   # Alt+w
bind -n M-s select-pane -D   # Alt+s


setw -g mode-keys vi
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"

bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection
bind -T copy-mode-vi Escape send -X cancel

# set -g @plugin 'tmux-plugins/tpm'
# set -g @plugin 'tmux-plugins/tmux-sensible'
# run '~/.tmux/plugins/tpm/tpm'
	'';

}
