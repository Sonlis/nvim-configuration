{ inputs, ...}: {
    home.file.".mozilla/firefox/default/chrome/firefox-rose-pine-theme".source = inputs.firefox-rose-pine-theme;
    programs.firefox.profiles.default = {
    };
}
