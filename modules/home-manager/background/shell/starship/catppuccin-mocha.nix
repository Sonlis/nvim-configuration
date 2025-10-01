{ config, lib, ... }:
{
   config = lib.mkIf (config.theme == "catppuccin_mocha") {
        programs.starship = {
            settings = {
                character = {
                    success_symbol = "[❯](green)";
                    error_symbol = "[❯](red)";
                    vimcmd_symbol = "[❮](subtext1)";
                };
                directory = {
                    style = "bold lavender";
                };
                  git_branch = {
                    format = "(fg:overlay)[ $symbol $branch ]($style)(fg:overlay) ";
                    style = "bold mauve";
                    symbol = "";
                  };
              git_status = {
                    disabled = false;
                    style = "fg:maroon";
                    format = "(fg:overlay)([$all_status$ahead_behind]($style))(fg:overlay) ";
                    up_to_date = "[ ✓ ](fg:blue)";
                    untracked = "[?\($count\)](fg:yellow)";
                    stashed = "[\$](fg:blue)";
                    modified = "[!\($count\)](fg:yellow)";
                    renamed = "[»\($count\)](fg:blue)";
                    deleted = "[✘\($count\)](style)";
                    staged = "[++\($count\)](fg:yellow)";
                    ahead = "[⇡\(\${count}\)](fg:teal)";
                    diverged = "⇕[\[](fg:blue)[⇡\(\${ahead_count}\)](fg:sapphire)[⇣\(\${behind_count}\)](fg:pink)[\]](fg:blue)";
                    behind = "[⇣\(\${count}\)](fg:pink)";
              };
            };
        };
    };
}
