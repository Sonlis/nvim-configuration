{ ... }:
{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar = {
        network.showWifiInfo = true;
        customModules.storage.paths = [ "/" ];

        layouts = {
          "0" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "media"
              "clock"
            ];
            right = [
              "volume"
              "network"
              "bluetooth"
              "battery"
              "systray"
              "notifications"
            ];
          };

          "1" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [
              "clock"
              "media"
            ];
            right = [
              "volume"
              "network"
              "bluetooth"
              "battery"
              "systray"
              "notifications"
            ];
          };

          "2" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            middle = [ "media" ];
            right = [
              "volume"
              "notifications"
            ];
          };
        };
      };
    };
  };
}
