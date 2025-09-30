{ self, pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    settings = rec {
      hyprland_config = ''
        exec-once = regreet; hyprctl dispatch exit
        misc {
            disable_hyprland_logo = true
            disable_splash_rendering = true
            disable_hyprland_qtutils_check = true
        }
      '';
      hyprlock_login = {
        command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprland_config}";
        user = "greeter";
      };
      default_session = hyprlock_login;
      background = {
        path = "${self}/assets/wallpapers/min-windows.jpg}";
      };
    };
  };
}
