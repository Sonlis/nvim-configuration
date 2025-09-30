{ lib, config, ... }:
{

    options.git = {
        userName = lib.mkOption {
            type = lib.types.str;
            default = "Sonlis";
        };
        email = lib.mkOption {
            type = lib.types.str;
            default = "bastien.jeannelle@gmail.com";
        };
    };

  config = {
      programs.git = {
        enable = true;
        userName = "${config.git.userName}";
        userEmail = "${config.git.email}";
        extraConfig = {
          safe.directory = [ "/etc/nixos" ];
          pull.rebase = true;
        };
    };
  };
}
