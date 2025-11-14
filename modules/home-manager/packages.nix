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
      networkmanagerapplet
      openstackclient
      pavucontrol
      thunderbird
      wl-clipboard
      yubikey-personalization

      # Dev
      awscli2
      go
      llvmPackages_21.libcxxClang
      poetry
      lua
      luarocks
      terraform

      discord
      nautilus
      qimgv
      netbird
      (python3.withPackages (
        ps: with ps; [
          ansible-core
          openstacksdk
          pytz
          python-lsp-server
          python-lsp-ruff
          pylint
          pyls-isort
          isort
          black
          ruff

          ## Required for some ansible roles in personal-environment
          botocore
          boto3
        ]
      ))
    ];

    # Programs natively supported by home-manager.
    # They can be configured in `programs.*` instead of using home.packages.
    programs = {
      jq.enable = true;
    };
  };
}
