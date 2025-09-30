{ config, ... }: 
let 
    colors = config.colors;
in
{
    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [
                "${colors.wallpaper}"
            ];
            wallpaper = [
                ",${colors.wallpaper}"
            ];
        };
    };
}
