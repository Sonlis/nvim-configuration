{ config, lib, ... }:
let 
    colors = config.colors.starship;
in
{

  programs.starship = {
    enableBashIntegration = lib.mkDefault config.programs.bash.enable;
    enableZshIntegration = lib.mkDefault config.programs.zsh.enable;
    settings = {
      format = "$hostname$directory$git_branch$git_state$git_status$kubernetes$character";
      command_timeout = 1000;
      add_newline = true;
      character = {
        success_symbol = "[❯](fg:${colors.pine})";
        error_symbol = "[❯](${colors.love})";
        vimcmd_symbol = "[❮](green)";
      };
      hostname = {
        ssh_only = true;
        style = "bold dimmed green";
        format = "[$ssh_symbol$hostname]($style): ";
      };
      directory = {
        truncation_length = 5;
        truncation_symbol = "../";
        style = "fg:${colors.pine}";
      };
      fill = {
        style = "fg:${colors.overlay}";
      };
      git_branch = {
        format = "(fg:${colors.overlay})[ $symbol $branch ]($style)(fg:overlay) ";
        style = "fg:${colors.foam}";
        symbol = "";
      };
      git_status = {
            disabled = false;
            style = "fg:love";
            format = "(fg:${colors.overlay})([$all_status$ahead_behind]($style))(fg:${colors.overlay}) ";
            up_to_date = "[ ✓ ](fg:${colors.iris})";
            untracked = "[?\($count\)](fg:${colors.gold})";
            stashed = "[\$](fg:${colors.iris})";
            modified = "[!\($count\)](fg:${colors.gold})";
            renamed = "[»\($count\)](fg:${colors.iris})";
            deleted = "[✘\($count\)](style)";
            staged = "[++\($count\)](fg:${colors.gold})";
            ahead = "[⇡\(\${count}\)](fg:${colors.foam})";
            diverged = "⇕[\[](fg:${colors.iris})[⇡\(\${ahead_count}\)](fg:${colors.foam})[⇣\(\${behind_count}\)](fg:${colors.rose})[\]](fg:${colors.iris})";
            behind = "[⇣\(\${count}\)](fg:${colors.rose})";
      };
      kubernetes = {
        format = "[$context](${colors.love})[( \($namespace\))](${colors.foam}) ";
        disabled = false;
      };
    };
  };
}
