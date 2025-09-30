{ ... }:
let
  font = "JetBrains Mono";
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = "false";
      };
      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };
      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = "90";
          font_family = font;

          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          font_size = "25";
          font_family = font;

          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];
    };
  };
}
