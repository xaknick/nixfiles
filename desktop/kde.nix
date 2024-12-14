{ pkgs, ... }:
{
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = [
    pkgs.xwaylandvideobridge
  ];
}
