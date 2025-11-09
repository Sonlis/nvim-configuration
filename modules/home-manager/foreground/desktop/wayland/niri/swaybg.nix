{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    systemd.user.services.swaybg = {
      Unit = {
        Description = "Background image utility";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Install = {
        WantedBy = [ "niri" ];
      };
      Service = {
        Restart = "on-failure";
        ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${config.colors.wallpaper}";
      };
    };
  };
}
