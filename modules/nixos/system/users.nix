{ config, pkgs, ... }:
{
  users.users."${config.username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "greeter"
      "input" # needed for espanso
    ];
    shell = pkgs.fish;
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
