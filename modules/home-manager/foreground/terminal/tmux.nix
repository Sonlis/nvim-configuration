{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "a";
    extraConfig = "bind -T copy-mode-vi y send -X copy-selection";
    plugins = [ pkgs.tmuxPlugins.catppuccin ];
  };

}
