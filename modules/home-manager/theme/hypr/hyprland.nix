{ config, ... }:
let 
    colors = config.colors;
in
{
    wayland.windowManager.hyprland.settings = {
        general = {
            "col.active_border" = colors.hyprland.active_border;
            "col.inactive_border" = colors.hyprland.inactive_border;
        };
    };
}
