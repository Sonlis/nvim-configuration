{ config, ... }:
let
  colors = config.colors;
in
{
  programs.fish = {
    interactiveShellInit = ''
      set -g fish_color_normal ${colors.fish.normal}
      set -g fish_color_command ${colors.fish.command}
      set -g fish_color_param ${colors.fish.param}
      set -g fish_color_keyword ${colors.fish.keyword}
      set -g fish_color_quote ${colors.fish.quote}
      set -g fish_color_redirection ${colors.fish.redirection}
      set -g fish_color_end ${colors.fish.end}
      set -g fish_color_comment ${colors.fish.comment}
      set -g fish_color_error ${colors.fish.error}
      set -g fish_color_gray ${colors.fish.gray}
      set -g fish_color_selection --background=${colors.fish.selection}
      set -g fish_color_search_match --background= ${colors.fish.search}
      set -g fish_color_option ${colors.fish.option}
      set -g fish_color_operator ${colors.fish.operator}
      set -g fish_color_escape ${colors.fish.escape}
      set -g fish_color_autosuggestion ${colors.fish.autosuggestion}
      set -g fish_color_cancel ${colors.fish.cancel}
      set -g fish_color_cwd ${colors.fish.cwd}
      set -g fish_color_user ${colors.fish.user}
      set -g fish_color_host ${colors.fish.host}
      set -g fish_color_host_remote ${colors.fish.remote}
      set -g fish_color_status ${colors.fish.status}
      set -g fish_pager_color_progress ${colors.fish.progress}
      set -g fish_pager_color_prefix ${colors.fish.prefix}
      set -g fish_pager_color_completion ${colors.fish.completion}
      set -g fish_pager_color_description ${colors.fish.description}
    '';
  };
}
