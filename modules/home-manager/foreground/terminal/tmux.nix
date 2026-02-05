{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = "bind -T copy-mode-vi y send -X copy-selection";
    plugins = [ pkgs.tmuxPlugins.catppuccin ];
  };

}
