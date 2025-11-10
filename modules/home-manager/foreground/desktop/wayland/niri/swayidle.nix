{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    systemd.user.services.swayidle = {
      Unit = {
        Description = "Idle management daemon";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Service = {
        Restart = "on-failure";
        ExecStart = "${pkgs.swayidle}/bin/swayidle -w timeout 601 'niri msg action power-off-monitors' timeout 600 '${pkgs.swaylock-effects}/bin/swaylock -f' before-sleep '${pkgs.swaylock-effects}/bin/swaylock --clock --indicator -f'";
      };
    };
  };
}
