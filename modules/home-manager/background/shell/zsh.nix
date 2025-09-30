{ ... }: let
    exports = [
        "SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)"
    ];
    aliases = [
       "os=\"openstack\""
    ];
    in 
    let
        formatted_exports = map (x: "export " +x) exports;
        formatted_aliases = map(x: "alias " +x) aliases;
    in
    {
    programs.zsh = {
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        initContent = ''
            bindkey "^[[1;5D" backward-word
            bindkey "^[[1;5C" forward-word
            ${builtins.concatStringsSep "\n" formatted_exports}
            ${builtins.concatStringsSep "\n" formatted_aliases}
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
