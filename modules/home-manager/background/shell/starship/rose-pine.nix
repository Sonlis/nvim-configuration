{ config, lib, ... }:
{
  config = lib.mkIf (config.theme == "rose-pine") {
    programs.starship = {
      settings = {
        character = {
          success_symbol = "[❯](foam)";
          error_symbol = "[❯](love)";
          vimcmd_symbol = "[❮](rose)";
        };
        directory = {
          style = "foam";
        };
        git_branch = {
          format = "(fg:iris)[ $symbol $branch ]($style)(fg:gold) ";
          style = "iris";
          symbol = "";
        };
        git_status = {
          disabled = false;
          style = "fg:gold";
          format = "[[($all_status$ahead_behind )](fg:gold)]($style)";
        };
      };
    };
  };
}
