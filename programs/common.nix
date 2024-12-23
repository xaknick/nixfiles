{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    inputs.zen-browser.packages."${pkgs.system}".default
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
