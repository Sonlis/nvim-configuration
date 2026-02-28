{ config, lib, ... }:
let
  palettes = {
    catppuccin_mocha = {
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
    };
    catppuccin_latte = {
      rosewater = "#dc8a78";
      flamingo = "#dd7878";
      pink = "#ea76cb";
      mauve = "#8839ef";
      red = "#d20f39";
      maroon = "#e64553";
      peach = "#fe640b";
      yellow = "#df8e1d";
      green = "#40a02b";
      teal = "#179299";
      sky = "#04a5e5";
      sapphire = "#209fb5";
      blue = "#1e66f5";
      lavender = "#7287fd";
      text = "#4c4f69";
      subtext1 = "#5c5f77";
      subtext0 = "#6c6f85";
      overlay2 = "#7c7f93";
      overlay1 = "#8c8fa1";
      overlay0 = "#9ca0b0";
      surface2 = "#acb0be";
      surface1 = "#bcc0cc";
      surface0 = "#ccd0da";
      base = "#eff1f5";
      mantle = "#e6e9ef";
      crust = "#dce0e8";
    };
    rose-pine = {
      overlay = "#26233a";
      love = "#eb6f92";
      gold = "#f6c177";
      rose = "#ebbcba";
      pine = "#31748f";
      foam = "#9ccfd8";
      iris = "#c4a7e7";
    };
  };
in
{
  imports = [
    ./catppuccin-mocha.nix
    ./rose-pine.nix
  ];

  programs.starship = {
    enableBashIntegration = lib.mkDefault config.programs.bash.enable;
    enableZshIntegration = lib.mkDefault config.programs.zsh.enable;
    enableFishIntegration = lib.mkDefault config.programs.fish.enable;
    settings = {
      format = "$hostname$directory$git_branch$git_state$git_status$kubernetes$character";
      command_timeout = 1000;
      add_newline = true;
      palettes = palettes;
      palette = config.theme;
      hostname = {
        ssh_only = true;
        style = "bold dimmed green";
        format = "[$ssh_symbol$hostname]($style): ";
      };
      directory = {
        truncation_length = 5;
        truncation_symbol = "../";
      };
      kubernetes = {
        disabled = false;
      };
    };
  };
}
