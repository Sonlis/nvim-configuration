{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  general = ''
    env = XCURSOR_SIZE,24

    windowrule = noblur, class:firefox
    windowrule = float, class:org.pulseaudio.pavucontrol
    source = ~/.config/hypr/monitors.conf 
    # Move and resize window with mod + LMB/RMB and dragging
    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
    # Ignore maximize requests from apps. You'll probably like this.
    windowrule = suppressevent maximize, class:.*
    # Fix some dragging issues with XWayland
    windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

    env = HYPRCURSOR_THEME,rose-pine-hyprcursor

    # Laptop multimedia keys for volume and LCD brightness
    bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
    bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
    bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

    # Requires playerctl
    bindl = , XF86AudioNext, exec, playerctl next
    bindl = , XF86AudioPause, exec, playerctl play-pause
    bindl = , XF86AudioPlay, exec, playerctl play-pause
    bindl = , XF86AudioPrev, exec, playerctl previous


    dwindle {
        pseudotile = true
        preserve_split = true
    }

    input {
        kb_layout = us
        kb_options = compose:ralt
        follow_mouse = 1
        touchpad {
            natural_scroll = true
        }
    }
  '';
in
{
  config = lib.mkIf (config.desktop == "hyprland") {
    wayland.windowManager.hyprland = {
      extraConfig = ''
        ${general}
      '';
      enable = true;
      settings = {
        "$mod" = "SUPER";

        "$terminal" = "foot";
        "$fileManager" = "nautilus";
        "$menu" = "walker";
        general = {
          gaps_in = 3;
          gaps_out = 5;
          border_size = 2;
        };
        decoration = {
          rounding = 10;
          active_opacity = 1;
          inactive_opacity = 1;
          blur = {
            enabled = true;
          };
          shadow = {
            enabled = false;
          };
        };
        animations = {
          enabled = false;
        };

        exec-once = [
          "systemctl --user start hyprpolkitagent"
          "wl-paste --type text --watch cliphist store"
          "walker --gapplication-service"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

        bind = [
          "$mod, Q, exec, uwsm app -- $terminal"
          "$mod, C, killactive"
          "$mod, M, exec, exit"
          "$mod, F, fullscreen, 1"
          "$mod, E, exec, uwsm app -- $fileManager"
          "$mod, V, togglefloating"
          "$mod, R, exec, $menu"
          "$mod, P, exec, $menu -m clipboard"
          "$mod, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"

          "$mod SHIFT, I, togglesplit"
          "$mod SHIFT, O, exec, hyprlock"
          "$mod SHIFT, S, exec, grim -g \"$(slurp -d)\" - >> /home/${config.user}/Pictures/screenshots/$(date +\"%Y-%m-%d %H:%M\")"

          "$mod SHIFT, L, movewindow, r"
          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, K, movewindow, u"
          "$mod SHIFT, J, movewindow, d"

          "$mod SHIFT, L, movewindow, r"
          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, K, movewindow, u"
          "$mod SHIFT, J, movewindow, d"

          "bind = $mod, N, togglespecialworkspace, magic"
          "bind = $mod SHIFT, N, movetoworkspace, special:magic"

        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
            ]
          ) 9
        ))
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));
      };
    };
    gtk = {
      enable = true;

      theme = {
        package = pkgs.flat-remix-gtk;
        name = "Flat-Remix-GTK-Grey-Darkest";
      };

      cursorTheme = {
        name = "rose-pine-hyprcursor";
        package = inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default;
        size = 22;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "mocha";
          accent = "lavender";
        };
      };

      font = {
        name = "JetBrains Mono";
        size = 11;
      };
    };
  };
}
