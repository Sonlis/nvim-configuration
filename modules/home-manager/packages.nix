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
      nwg-displays
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
      terraform

      discord
      nautilus
      qimgv
      netbird
      (python3.withPackages (
        ps: with ps; [
          ansible-core
          openstacksdk
          python-lsp-server
          python-lsp-jsonrpc
          python-lsp-black
          python-lsp-ruff
          pyls-isort
          pyls-flake8
          flake8
          isort
          black
          ruff
          pytz

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
