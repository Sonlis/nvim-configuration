{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    services = {
      mako.enable = true;
    };
  };
}
