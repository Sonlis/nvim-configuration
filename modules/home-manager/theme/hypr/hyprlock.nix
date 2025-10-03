{ config, ... }:
let
  font = "JetBrains Mono";
  colors = config.colors;
in
{
  programs.hyprlock.settings = {
    background = {
      monitor = "";
      path = colors.hyprlock.background_path;
    };
    input-field = {
      monitor = "";
      size = "20%, 5%";
      outline_thickness = 3;
      inner_color = "rgba(0, 0, 0, 0.0) # no fill";

      outer_color = "${colors.hyprlock.outer_colors} 45deg";
      check_color = "${colors.hyprlock.check_colors} 120deg";
      fail_color = "${colors.hyprlock.fail_colors} 40deg";

      font_color = "rgb(143, 143, 143)";
      fade_on_empty = "true";
      rounding = 15;

      font_family = font;
      placeholder_text = "Input password...";
      fail_text = "$PAMFAIL";

      # uncomment to use a letter instead of a dot to indicate the typed password
      # dots_text_format = *
      # dots_size = 0.4
      dots_spacing = 0.3;

      # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
      # hide_input = true

      position = "0, -250";
      halign = "center";
      valign = "center";
    };
  };
}
