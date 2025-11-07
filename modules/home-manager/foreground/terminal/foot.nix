{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrains Mono NF:size=12";
        shell = "${config.shell.main}";
      };
      key-bindings = {
        show-urls-launch = "Control+Shift+p";
        show-urls-persistent = "Control+Shift+o";
      };
    };
  };
}
