{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.desktop == "niri") {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          clock = {
            actions = {
              on-click-right = "mode";
              on-scroll-down = "shift_down";
              on-scroll-up = "shift_up";
            };
            calendar = {
              format = {
                days = "<span color='#ffffff'>{}</span>";
                months = "<span color='#94e2d5'><b>{}</b></span>";
                today = "<span color='#f2cdcd'><b><u>{}</u></b></span>";
                weekdays = "<span color='#f2cdcd'>{}</span>";
              };
              mode = "month";
              mode-mon-col = 3;
              on-scroll = 1;
            };
            format = "󰸗 {:%a %b %Y %I:%M %p}";
            tooltip-format = "<tt>{calendar}</tt>";
          };
          margin-left = 5;
          margin-right = 5;
          margin-top = 5;
          modules-center = [
            "mpris"
            "clock"
          ];
          modules-left = [
            "niri/workspaces"
          ];
          modules-right = [
            "wireplumber"
            "wireplumber#source"
            "network"
            "bluetooth"
            "battery"
          ];
          battery = {
            interval = 60;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            max-length = 25;
          };
          bluetooth = {
            format = " {status}";
            format-connected = " {device_alias}";
            format-connected-battery = " {device_alias} {device_battery_percentage}%";
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          };
          network = {
            format = "{ifname}";
            format-wifi = "  {essid}";
            format-ethernet = "󰊗 {ipaddr}/{cidr}";
            format-disconnected = "󰖪";
            tooltip = false;
            max-length = 50;
          };
          wireplumber = {
            format = "{icon} {volume}%";
            format-muted = "󰝟 {volume}%";
            on-click = "helvum";
            format-icons = [
              ""
              ""
              ""
            ];
            tooltip-format = "{node_name}";
          };
          "wireplumber#source" = {
            node-type = "Audio/Source";
            format = "󰍬 {volume}%";
            format-muted = "󰍭 {volume}%";
            on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            scroll-step = 5;
          };
          mpris = {
            format = "{player_icon} {title} - <i>{artist}</i>";
            format-paused = "{status_icon} {title} - <i>{artist}</i>";
            format-stopped = "Media";
            player-icons = {
              default = "▶";
              mpv = "🎵";
            };
            status-icons = {
              paused = "⏸";
              stopped = "🎵";
            };
          };
          "niri/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              default = "";
            };
          };
          position = "top";
        };
      };
      style = ''
        tooltip {
             border-radius: 4px;
             background-color: #242438;
             border: 7px solid black;
             font-family: "JetBrainsMono Nerd Font";
        }

        * {
            border: none;
            font-family: "JetBrainsMono Nerd Font";
        }
        window#waybar {
            background: none;
        }

        #clock,
        #mpris,
        #bluetooth,
        #battery,
        #network,
        #wireplumber,
        #workspaces {
            background: #242438;
            border-radius: 5px;
            padding: 0px 10px;
        }

        #workspaces button.focused {
            color: #f5c2e7;
            padding: 5px;
        }

        #workspaces button {
            color: #f5e0dc;
            padding: 5px;
        }

        #clock {
            font-size: 100%;
            color: #f5c2e7;
            font-weight: bold;
        }

        #mpris {
            color: #b4befe;
            font-weight: bold;
            margin-right: 10px;
            padding: 0px 10px;
        }

        #wireplumber {
            color: #eba0ac;
        }

        #network {
            color: #cba6f7;
        }

        #network,
        #bluetooth,
        #battery,
        #wireplumber {
            margin-right: 8px;
        }

        #bluetooth {
            color: #89dceb;
        }

        #battery {
            color: #f9e2af;
        }

      '';
    };
  };
}
