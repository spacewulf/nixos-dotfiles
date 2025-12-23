{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
      fzf
    ];
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 100000;
      prefix = "C-Space";
      keyMode = "vi";
      extraConfig = ''
	set -ga terminal-overrides ",*256col*:Tc" # Override to enable true-color for compatible terminals

	set -g set-clipboard on # Use system clipboard
	set -g mouse on # Enable mouse support
	set -g status-interval 3 # Update the status bar every 3 seconds (default: 15)
	set -g detach-on-destroy off # Don't exit from tmux when closing a session

	unbind C-b # Unbind the default prefix key
	set -g prefix C-Space # Set new prefix key to Ctrl+Space

	# Refresh tmux config with 'r'
	unbind r
	bind r source-file ~/.config/tmux/tmux.conf

	# Change the shortcuts for pane splitting (horizontally then vertically)
	unbind %
	bind \\ split-window -h -c "#{pane_current_path}"

	unbind \"
	bind - split-window -v -c "#{pane_current_path}"

	# New window in same path
	bind c new-window -c "#{pane_current_path}"

	# Use vim arrow keys to resize
	bind -r j resize-pane -D 5
	bind -r k resize-pane -U 5
	bind -r l resize-pane -R 5
	bind -r h resize-pane -L 5
	bind -r m resize-pane -Z # Use m key to maximize pane

	# Enable vi mode to allow vim movements
	set-window-option -g mode-keys vi

	# Start selecting text with "y"
	bind-key -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "wl-copy"

	# Don't exit copy mode when dragging with mouse
	unbind -T copy-mode-vi MouseDragEnd1Pane

	# Start windows and panes at 1, not 0
	set -g base-index 1
	set -g pane-base-index 1
	set -g renumber-windows on # Automatically renumber windows

	# List of plugins
	set -g @plugin 'christoomey/vim-tmux-navigator' # Enable navigating between nvim and tmux

	# Custom Theme
	set -g mode-style "fg=#0c0c0c,bg=#b6b8bb"
	set -g message-style "fg=#0c0c0c,bg=#b6b8bb"
	set -g message-command-style "fg=#0c0c0c,bg=#b6b8bb"
	set -g pane-border-style "fg=#b6b8bb"
	set -g pane-active-border-style "fg=#78a9ff"
	set -g status "on"
	set -g status-justify "left"
	set -g status-style "fg=#b6b8bb,bg=#0c0c0c"
	set -g status-left-length "100"
	set -g status-right-length "100"
	set -g status-left-style NONE
	set -g status-right-style NONE
	set -g status-left "#[fg=#0c0c0c,bg=#78a9ff,bold] #S #[fg=#78a9ff,bg=#0c0c0c,nobold,nounderscore,noitalics]"
	set -g status-right "#[fg=#0c0c0c,bg=#0c0c0c,nobold,nounderscore,noitalics]#[fg=#78a9ff,bg=#0c0c0c] #{prefix_highlight} #[fg=#b6b8bb,bg=#0c0c0c,nobold,nounderscore,noitalics]#[fg=#0c0c0c,bg=#b6b8bb] %Y-%m-%d  %I:%M %p #[fg=#78a9ff,bg=#b6b8bb,nobold,nounderscore,noitalics]#[fg=#0c0c0c,bg=#78a9ff,bold] #h "
	setw -g window-status-activity-style "underscore,fg=#7b7c7e,bg=#0c0c0c"
	setw -g window-status-separator ""
	setw -g window-status-style "NONE,fg=#7b7c7e,bg=#0c0c0c"
	setw -g window-status-format "#[fg=#0c0c0c,bg=#0c0c0c,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#0c0c0c,bg=#0c0c0c,nobold,nounderscore,noitalics]"
	setw -g window-status-current-format "#[fg=#0c0c0c,bg=#b6b8bb,nobold,nounderscore,noitalics]#[fg=#0c0c0c,bg=#b6b8bb,bold] #I  #W #F #[fg=#b6b8bb,bg=#0c0c0c,nobold,nounderscore,noitalics]"
	# set -g status-right " #{cpu -i 3} |  #{mem} "

	set -g @resurrect-capture-pane-contents 'on'
	# set -g @continuum-restore 'on'

	# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
	run '~/.tmux/plugins/tpm/tpm'
      '';
    };
}
	# programs.tmux = {
	# 	enable = true;
	# 	shell = "${pkgs.zsh}/bin/zsh";
	# 	terminal = "tmux-256color";
	# 	historyLimit = 100000;
	# };
