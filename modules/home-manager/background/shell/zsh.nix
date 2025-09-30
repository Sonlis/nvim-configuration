{ ... }: let
    exports = [
        "SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)"
    ];
    in 
    let
        formatted_exports = map (x: "export " +x) exports;
    in
    {
    programs.zsh = {
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        shellAliases = {
            os = "openstack";
            k = "kubectl";
        };
        initContent = ''
            bindkey "^[[1;5D" backward-word
            bindkey "^[[1;5C" forward-word
            ${builtins.concatStringsSep "\n" formatted_exports}
            eval "$(starship init zsh)"
        '';
        profileExtra = ''
            if uwsm check may-start; then
                exec uswm start hyprland-uwsm.desktop
            fi
        '';
    };
    programs.atuin = {
        enable = true;
    };
}
