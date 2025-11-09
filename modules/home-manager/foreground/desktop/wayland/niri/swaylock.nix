{
  config,
  pkgs,
  lib,
  self,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    xdg.configFile.swaylock = {
      enable = true;
      target = "swaylock/config";
      text = ''
        effect-blur=7x5
        ring-color=91d7e3
        inside-color=11111b
        text-color=cdd6f4
        line-color=1e1e2e
        image=${self}/assets/wallpapers/hollow-knight.jpg
        scaling=fill
      '';
    };
  };
}
