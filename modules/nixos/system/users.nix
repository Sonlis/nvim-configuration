{ config, pkgs, ... }:
{
  users.users."${config.username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "greeter"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
