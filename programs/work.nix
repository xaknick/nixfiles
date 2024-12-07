{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
    gitkraken
    slack
    thunderbird-latest
  ];
}

