{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    xdg.configFile.nmtuiRice = {
      enable = true;
      target = "nmtui/footColors.ini";
      text = ''
        [colors]

        regular0=cdd6f4  # text
        regular1=eba0ac  # overlay
        regular4=1e1e2e  # background
        regular7=1e1e2e  # background2

      '';
    };
  };
}
