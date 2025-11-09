{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    programs = {
      waybar.enable = true;
    };
    systemd.user.services.waybar = {
      Install = {
        WantedBy = [ "niri" ];
      };
    };
  };
}
