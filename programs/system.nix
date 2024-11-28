{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    gcc
    gnumake
    zsh
    inputs.wezterm.packages.${pkgs.system}.default
  ];

  # Configure ZSH
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
