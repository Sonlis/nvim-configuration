{ pkgs, ... }:
{
  #home.file.".mozilla/firefox/nix-user-profile/chrome/firefox-rose-pine-theme" = inputs.firefox-rose-pine-theme;
  programs.firefox = {
    enable = true;
    languagePacks = [ "en" ];
    profiles.default = {
      name = "Bastibast";
      search = {
        default = "ddg";
        privateDefault = "ddg";
        engines = {
          "youtube" = {
            icon = "https://youtube.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@yt" ];
            urls = [
              {
                template = "https://www.youtube.com/results";
                params = [
                  {
                    name = "search_query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
          "github" = {
            icon = "https://github.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@gh" ];
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
        };
      };
    };
    policies = {
      FirefoxHome = {
        Search = false;
      };
      SearchBar = "unified";
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "never";
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4567044/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };
}
