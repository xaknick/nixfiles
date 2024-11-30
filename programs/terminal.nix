{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.wezterm.packages.${pkgs.system}.default
    zsh
    fzf # fuzzy finder
    starship # promt
  ];

  # Configure ZSH
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
