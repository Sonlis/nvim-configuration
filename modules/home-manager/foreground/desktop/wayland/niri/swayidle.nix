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
        ExecStart = "${pkgs.swayidle}/bin/swayidle -w timeout 450 'niri msg action power-off-monitors' timeout 300 '${pkgs.swaylock-effects}/bin/swaylock --clock --indicator -f' timeout 600 'systemctl suspend' before-sleep '${pkgs.swaylock-effects}/bin/swaylock --clock --indicator -f'";
      };
    };
  };
}
