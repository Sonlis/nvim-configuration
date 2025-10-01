{ config, lib, ... }:
{
   config = lib.mkIf (config.theme == "rose-pine") {
        programs.starship = {
            settings = {
                kubernetes = {
                    format = "[$context](love)[( \($namespace\))](foam) ";
                };
                directory = {
                    truncation_length = 5;
                    truncation_symbol = "../";
                    style = "fg:text";
                };
              git_branch = {
                format = "(fg:overlay)[ $symbol $branch ]($style)(fg:overlay) ";
                style = "fg:iris";
                symbol = "";
              };
              git_status = {
                    disabled = false;
                    style = "fg:love";
                    format = "(fg:overlay)([$all_status$ahead_behind]($style))(fg:overlay) ";
                    up_to_date = "[ ✓ ](fg:iris)";
                    untracked = "[?\($count\)](fg:gold)";
                    stashed = "[\$](fg:iris)";
                    modified = "[!\($count\)](fg:gold)";
                    renamed = "[»\($count\)](fg:iris)";
                    deleted = "[✘\($count\)](style)";
                    staged = "[++\($count\)](fg:gold)";
                    ahead = "[⇡\(\${count}\)](fg:foam)";
                    diverged = "⇕[\[](fg:iris)[⇡\(\${ahead_count}\)](fg:foam)[⇣\(\${behind_count}\)](fg:rose)[\]](fg:iris)";
                    behind = "[⇣\(\${count}\)](fg:rose)";
              };
              character = {
                success_symbol = "[❯](fg:pine)";
                error_symbol = "[❯](love)";
                vimcmd_symbol = "[❮](green)";
              };
            };
        };
    };
}

