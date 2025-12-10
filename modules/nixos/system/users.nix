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

  # The following part is required for the greeter to be able
  # to read configuration files.
  # Ensure ACL support is available on the filesystem
  fileSystems."/" = {
    # If using ext4/xfs this mount option is required
    options = [ "acl" ];
  };

  # Run commands after users exist
  system.activationScripts.greeterAcls = {
    deps = [ "users" ];
    text = ''

      chgrp -R greeter /home/${config.username}/.config/DankMaterialShell
      chmod -R g+rX /home/${config.username}/.config/DankMaterialShell

      chgrp -R greeter /home/${config.username}/.local/state/DankMaterialShell
      chmod -R g+rX /home/${config.username}/.local/state/DankMaterialShell

      chgrp -R greeter /home/${config.username}/.cache/quickshell
      chmod -R g+rX /home/${config.username}/.cache/quickshell
    '';
  };

  systemd.tmpfiles.rules = [
    "a /home/${config.username} u:greeter:x"
    "a /home/${config.username}/.config u:greeter:x"
    "a /home/${config.username}/.local u:greeter:x"
    "a /home/${config.username}/.cache u:greeter:x"
    "a /home/${config.username}/.local/state u:greeter:x"
    "L+ /var/cache/dms-greeter/settings.json - - - - /home/${config.username}/.config/DankMaterialShell/settings.json"
    "L+ /var/cache/dms-greeter/session.json - - - - /home/${config.username}/.local/state/DankMaterialShell/session.json"
    "L+ /var/cache/dms-greeter/colors.json - - - - /home/${config.username}/.cache/quickshell/dankshell/dms-colors.json"
  ];
}
