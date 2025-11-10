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
    xdg.configFile.mako = {
      enable = true;
      target = "mako/config";
      text = ''
        background-color=#1e1e2e
        text-color=#cdd6f4
        border-color=#cba6f7
        progress-color=over #313244
        default-timeout=15000

        [urgency=high]
        border-color=#fab387
      '';
    };
  };
}
