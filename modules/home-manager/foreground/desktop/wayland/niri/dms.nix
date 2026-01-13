{
  inputs,
  config,
  lib,
  ...
}:
let
  colors = config.colors;
in
{
  imports = [
    inputs.dankMaterialShell.homeModules.dank-material-shell
  ];
  config = lib.mkIf (config.desktop == "niri") {
    programs.dank-material-shell = {
      enable = true;
      settings = {
        isLightMode = false;
        doNotDisturb = false;
        wallpaperPath = colors.wallpaper;
        perMonitorWallpaper = false;
        monitorWallpapers = {
        };
        perModeWallpaper = false;
        wallpaperPathLight = colors.wallpaper;
        wallpaperPathDark = colors.wallpaper;
        monitorWallpapersLight = {
        };
        monitorWallpapersDark = {
        };
        wallpaperTransition = "fade";
        includedTransitions = [
          "fade"
          "wipe"
          "disc"
          "stripes"
          "iris bloom"
          "pixelate"
          "portal"
        ];
        wallpaperCyclingEnabled = false;
        wallpaperCyclingMode = "interval";
        wallpaperCyclingInterval = 300;
        wallpaperCyclingTime = "06:00";
        monitorCyclingSettings = {
        };
        nightModeEnabled = true;
        nightModeTemperature = 2900;
        nightModeHighTemperature = 7300;
        nightModeAutoEnabled = true;
        nightModeAutoMode = "location";
        nightModeStartHour = 18;
        nightModeStartMinute = 0;
        nightModeEndHour = 6;
        nightModeEndMinute = 0;
        latitude = 0;
        longitude = 0;
        nightModeUseIPLocation = true;
        nightModeLocationProvider = "";
        weatherLocation = "New York, NY";
        weatherCoordinates = "40.7128,-74.0060";
        pinnedApps = [

        ];
        hiddenTrayIds = [

        ];
        recentColors = [

        ];
        showThirdPartyPlugins = false;
        launchPrefix = "";
        lastBrightnessDevice = "";
        brightnessExponentialDevices = {
        };
        brightnessUserSetValues = {
        };
        brightnessExponentValues = {
        };
        selectedGpuIndex = 0;
        nvidiaGpuTempEnabled = false;
        nonNvidiaGpuTempEnabled = false;
        enabledGpuPciIds = [

        ];
        wifiDeviceOverride = "";
        weatherHourlyDetailed = true;
        configVersion = 2;
      };
      session = {
        isLightMode = false;
        wallpaperPath = colors.wallpaper;
        perMonitorWallpaper = false;
        monitorWallpapers = {
        };
        perModeWallpaper = false;
        wallpaperPathLight = colors.wallpaper;
        wallpaperPathDark = colors.wallpaper;
        monitorWallpapersLight = {
        };
        monitorWallpapersDark = {
        };
        brightnessExponentialDevices = {
        };
        brightnessUserSetValues = {
        };
        brightnessExponentValues = {
        };
        doNotDisturb = false;
        nightModeEnabled = true;
        nightModeTemperature = 2000;
        nightModeHighTemperature = 6500;
        nightModeAutoEnabled = false;
        nightModeAutoMode = "time";
        nightModeStartHour = 18;
        nightModeStartMinute = 0;
        nightModeEndHour = 6;
        nightModeEndMinute = 0;
        latitude = 0;
        longitude = 0;
        nightModeUseIPLocation = false;
        nightModeLocationProvider = "";
        pinnedApps = [

        ];
        hiddenTrayIds = [

        ];
        selectedGpuIndex = 0;
        nvidiaGpuTempEnabled = false;
        nonNvidiaGpuTempEnabled = false;
        enabledGpuPciIds = [

        ];
        wifiDeviceOverride = "";
        weatherHourlyDetailed = true;
        wallpaperCyclingEnabled = false;
        wallpaperCyclingMode = "interval";
        wallpaperCyclingInterval = 300;
        wallpaperCyclingTime = "06:00";
        monitorCyclingSettings = {
        };
        lastBrightnessDevice = "";
        launchPrefix = "";
        wallpaperTransition = "fade";
        includedTransitions = [
          "fade"
          "wipe"
          "disc"
          "stripes"
          "iris bloom"
          "pixelate"
          "portal"
        ];
        recentColors = [

        ];
        showThirdPartyPlugins = false;
        configVersion = 1;
      };
    };
  };
}
