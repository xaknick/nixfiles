{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
  ];
}
