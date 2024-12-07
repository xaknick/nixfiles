{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    eza
    zoxide
    just
    neofetch
    mc
    yazi
    lazygit
    cowsay
    figlet
    btop
    ncdu
  ];
}
