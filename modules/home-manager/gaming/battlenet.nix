{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.gaming = {
    enable = lib.mkEnableOption "Enable gaming";
  };

  config = lib.mkIf config.gaming.enable {
    programs.steam.enable = true;
  };
}
