{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    git
    gcc
    gnumake
    stow
    zip
    unzip
    jq
    file
    which
    tree
    wget
    curl
    killall
  ];
}
