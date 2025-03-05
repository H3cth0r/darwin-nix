{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-terminal "screen-256color"

      # change the prefix tab
      set -g prefix C-a
      unbind C-b
      bind-key C-a send-prefix

      # read changes on config file
      unbind r
      bind r source-file ~/.tmux.conf

      # resize panes
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      # maximize pane and restore
      bind -r m resize-pane -Z

      # enable mouse interaction
      set -g mouse on

      # tpm plugin
      set -g @plugin 'tmux-plugins/tpm'

      # list of tmux plugins
      set -g @plugin 'christoomey/vim-tmux-navigator'

      # init tmux plugin manager, keep this at the bottom
      run '~/.tmux/plugins/tpm/tpm'

      # automatic renumber windows
      set -g renumber-windows on
    '';

    # Optional: Install TPM (Tmux Plugin Manager)
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
  };
}
