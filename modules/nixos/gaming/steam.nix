{
  config,
  lib,
  ...
}:
{
  options.gaming = {
    enable = lib.mkEnableOption "Enable gaming";
    default = false;
  };

  config = lib.mkIf config.gaming.enable {
    programs.steam.enable = true;
  };
}
