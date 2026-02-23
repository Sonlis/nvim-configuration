{ pkgs, ... }:
{
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
      kubernetes-helm
      fd # find alternative, mostly used by neovim-telescope
      gonzo # Log analysis
      xh # Friendly curl
      networkmanagerapplet
      openstackclient
      pavucontrol
      prek
      thunderbird
      wl-clipboard
      yubikey-personalization

      # Dev
      awscli2
      go
      llvmPackages_21.libcxxClang
      lua
      luarocks
      terraform
      nodejs_24
      yarn

      # Dev python
      ruff
      ty
      uv

      signal-desktop
      discord
      nautilus
      qimgv # Image viewer
      netbird
      ytmdesktop
    ];

    # Programs natively supported by home-manager.
    # They can be configured in `programs.*` instead of using home.packages.
    programs = {
      jq.enable = true;
    };
  };
}
