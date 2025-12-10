{ inputs, config, ... }:
let
  colors = config.colors;
in
{

  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];
  programs.dankMaterialShell = {
    enable = true;
    default = {
      settings = {
        currentThemeName = "dynamic";
        matugenScheme = "scheme-vibrant";
        runUserMatugenTemplates = true;
        matugenTargetMonitor = "";
        popupTransparency = 1;
        dockTransparency = 1;
        widgetBackgroundColor = "s";
        widgetColorMode = "colorful";
        cornerRadius = 12;
        use24HourClock = true;
        showSeconds = false;
        useFahrenheit = false;
        nightModeEnabled = true;
        animationSpeed = 1;
        customAnimationDuration = 500;
        wallpaperFillMode = "Fill";
        blurredWallpaperLayer = false;
        blurWallpaperOnOverview = false;
        showLauncherButton = true;
        showWorkspaceSwitcher = true;
        showFocusedWindow = true;
        showWeather = false;
        showMusic = true;
        showClipboard = false;
        showCpuUsage = true;
        showMemUsage = false;
        showCpuTemp = true;
        showGpuTemp = true;
        selectedGpuIndex = 0;
        showSystemTray = true;
        showClock = true;
        showNotificationButton = true;
        showBattery = true;
        showControlCenterButton = true;
        showCapsLockIndicator = false;
        controlCenterShowNetworkIcon = true;
        controlCenterShowBluetoothIcon = true;
        controlCenterShowAudioIcon = true;
        controlCenterShowVpnIcon = false;
        controlCenterShowBrightnessIcon = false;
        controlCenterShowMicIcon = false;
        controlCenterShowBatteryIcon = false;
        controlCenterShowPrinterIcon = false;
        showPrivacyButton = true;
        privacyShowMicIcon = false;
        privacyShowCameraIcon = false;
        privacyShowScreenShareIcon = false;
        controlCenterWidgets = [
          {
            id = "volumeSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "brightnessSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "wifi";
            enabled = true;
            width = 50;
          }
          {
            id = "bluetooth";
            enabled = true;
            width = 50;
          }
          {
            id = "audioOutput";
            enabled = true;
            width = 50;
          }
          {
            id = "audioInput";
            enabled = true;
            width = 50;
          }
          {
            id = "nightMode";
            enabled = true;
            width = 50;
          }
          {
            id = "darkMode";
            enabled = true;
            width = 50;
          }
        ];
        showWorkspaceIndex = false;
        showWorkspacePadding = false;
        workspaceScrolling = false;
        showWorkspaceApps = false;
        maxWorkspaceIcons = 3;
        workspacesPerMonitor = true;
        showOccupiedWorkspacesOnly = false;
        dwlShowAllTags = false;
        workspaceNameIcons = {
        };
        waveProgressEnabled = true;
        scrollTitleEnabled = true;
        clockCompactMode = false;
        focusedWindowCompactMode = false;
        runningAppsCompactMode = true;
        keyboardLayoutNameCompactMode = false;
        runningAppsCurrentWorkspace = false;
        runningAppsGroupByApp = false;
        centeringMode = "index";
        clockDateFormat = "ddd MMM d";
        lockDateFormat = "";
        mediaSize = 1;
        appLauncherViewMode = "list";
        spotlightModalViewMode = "list";
        sortAppsAlphabetically = false;
        appLauncherGridColumns = 4;
        spotlightCloseNiriOverview = true;
        niriOverviewOverlayEnabled = true;
        weatherLocation = "New York, NY";
        weatherCoordinates = "40.7128,-74.0060";
        useAutoLocation = false;
        weatherEnabled = false;
        networkPreference = "wifi";
        vpnLastConnected = "";
        iconTheme = "System Default";
        launcherLogoMode = "compositor";
        launcherLogoCustomPath = "";
        launcherLogoColorOverride = "";
        launcherLogoColorInvertOnMode = false;
        launcherLogoBrightness = {
        };
        launcherLogoContrast = 1;
        launcherLogoSizeOffset = 0;
        fontFamily = "JetBrainsMono Nerd Font Mono";
        monoFontFamily = "Fira Code";
        fontWeight = 400;
        fontScale = 1;
        notepadUseMonospace = true;
        notepadFontFamily = "";
        notepadFontSize = 14;
        notepadShowLineNumbers = false;
        notepadTransparencyOverride = -1;
        notepadLastCustomTransparency = {
        };
        soundsEnabled = true;
        useSystemSoundTheme = false;
        soundNewNotification = true;
        soundVolumeChanged = true;
        soundPluggedIn = true;
        acMonitorTimeout = 600;
        acLockTimeout = 300;
        acSuspendTimeout = 900;
        acSuspendBehavior = 0;
        acProfileName = "";
        batteryMonitorTimeout = 0;
        batteryLockTimeout = 0;
        batterySuspendTimeout = 0;
        batterySuspendBehavior = 0;
        batteryProfileName = "";
        lockBeforeSuspend = false;
        preventIdleForMedia = false;
        loginctlLockIntegration = true;
        fadeToLockEnabled = false;
        fadeToLockGracePeriod = 5;
        launchPrefix = "";
        brightnessDevicePins = {
        };
        wifiNetworkPins = {
        };
        bluetoothDevicePins = {
        };
        audioInputDevicePins = {
        };
        audioOutputDevicePins = {
        };
        gtkThemingEnabled = false;
        qtThemingEnabled = false;
        syncModeWithPortal = true;
        terminalsAlwaysDark = false;
        showDock = false;
        dockAutoHide = false;
        dockGroupByApp = false;
        dockOpenOnOverview = false;
        dockPosition = 1;
        dockSpacing = 4;
        dockBottomGap = 0;
        dockMargin = 0;
        dockIconSize = 40;
        dockIndicatorStyle = "circle";
        dockBorderEnabled = false;
        dockBorderColor = "surfaceText";
        dockBorderOpacity = 1;
        dockBorderThickness = 1;
        notificationOverlayEnabled = false;
        modalDarkenBackground = true;
        lockScreenShowPowerActions = true;
        enableFprint = false;
        maxFprintTries = 3;
        lockScreenActiveMonitor = "all";
        lockScreenInactiveColor = "#000000";
        hideBrightnessSlider = false;
        notificationTimeoutLow = 5000;
        notificationTimeoutNormal = 5000;
        notificationTimeoutCritical = 0;
        notificationPopupPosition = 0;
        osdAlwaysShowValue = false;
        osdPosition = 5;
        osdVolumeEnabled = true;
        osdMediaVolumeEnabled = true;
        osdBrightnessEnabled = true;
        osdIdleInhibitorEnabled = true;
        osdMicMuteEnabled = true;
        osdCapsLockEnabled = true;
        osdPowerProfileEnabled = false;
        osdAudioOutputEnabled = true;
        powerActionConfirm = true;
        powerActionHoldDuration = 1;
        powerMenuActions = [
          "reboot"
          "logout"
          "poweroff"
          "lock"
          "suspend"
          "restart"
        ];
        powerMenuDefaultAction = "logout";
        powerMenuGridLayout = false;
        customPowerActionLock = "";
        customPowerActionLogout = "";
        customPowerActionSuspend = "";
        customPowerActionHibernate = "";
        customPowerActionReboot = "";
        customPowerActionPowerOff = "";
        updaterUseCustomCommand = false;
        updaterCustomCommand = "";
        updaterTerminalAdditionalParams = "";
        displayNameMode = "system";
        screenPreferences = {
        };
        showOnLastDisplay = {
        };
        barConfigs = [
          {
            id = "default";
            name = "Main Bar";
            enabled = true;
            position = 0;
            screenPreferences = [
              "all"
            ];
            showOnLastDisplay = true;
            leftWidgets = [
              "workspaceSwitcher"
              "focusedWindow"
            ];
            centerWidgets = [
              {
                id = "music";
                enabled = true;
                mediaSize = 1;
              }
              {
                id = "clock";
                enabled = true;
                clockCompactMode = false;
              }
            ];
            rightWidgets = [
              {
                id = "network_speed_monitor";
                enabled = true;
              }
              {
                id = "notificationButton";
                enabled = true;
              }
              {
                id = "controlCenterButton";
                enabled = true;
              }
              {
                id = "battery";
                enabled = true;
              }
            ];
            spacing = 3;
            innerPadding = 4;
            bottomGap = 0;
            transparency = 0;
            widgetTransparency = 1;
            squareCorners = false;
            noBackground = false;
            gothCornersEnabled = false;
            gothCornerRadiusOverride = false;
            gothCornerRadiusValue = 12;
            borderEnabled = false;
            borderColor = "surfaceText";
            borderOpacity = 1;
            borderThickness = 1;
            widgetOutlineEnabled = true;
            widgetOutlineColor = "primary";
            widgetOutlineOpacity = {
            };
            widgetOutlineThickness = 1;
            fontScale = 1;
            autoHide = false;
            autoHideDelay = 250;
            openOnOverview = false;
            visible = true;
            popupGapsAuto = true;
            popupGapsManual = 4;
          }
        ];
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
