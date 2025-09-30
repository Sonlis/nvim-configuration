{  pkgs, lib, config, ... }:
{
  options = {
    machine.type = lib.mkOption {
        description = "Is it a work or personal laptop?";
    };
  }; 
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  config = {
      home.packages = with pkgs; [
        # Unix tools
        fzf
        gnumake
        gnupg
        tree
        ripgrep
        unzip
        zip

        # Screenshot
        grim
        slurp

        # Kube
        kubectl
        kubie

        # Tools
        k9s
        networkmanagerapplet
        nwg-displays
        openstackclient
        pavucontrol
        thunderbird
        wl-clipboard
        yubikey-personalization

        # Dev
        go
        llvmPackages_21.libcxxClang
        neovim
        poetry
        python3

        discord
        nautilus
        qimgv
        netbird
        
        # Lsps
        bash-language-server
        gopls
        lua-language-server
        nil
        pkgs.nixfmt-rfc-style

      ] ++ lib.optionals (config.type == "infowork") [
        # Infomaniak
        keepassxc
      ];

      # Programs natively supported by home-manager.
      # They can be configured in `programs.*` instead of using home.packages.
      programs = {
        jq.enable = true;
      };
  };
}
