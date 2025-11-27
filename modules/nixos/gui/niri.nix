{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    programs.niri = {
      enable = true;
    };
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red'";
          user = "greeter";
        };
      };
    };
  };
}
