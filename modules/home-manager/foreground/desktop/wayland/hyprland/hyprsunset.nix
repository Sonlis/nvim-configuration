{ lib, config, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    services.hyprsunset.enable = true;
    services.hyprsunset.settings = {
      profile = [
        {
          time = "7:30";
          identity = true;
        }
        {
          time = "19:30";
          temperature = 5000;
        }
        {
          time = "22:00";
          temperature = 4000;
        }
      ];
    };
  };
}
