{ ... }:
{
  # Starship handles the prompt
  home.file.".kube/kubie.yaml" = {
    text = ''
      prompt:
          disable: true
    '';
  };
}
