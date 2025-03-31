{
  pkgs,
  hyprlandEnabled ? false,
  ...
}:

let
  excludedPlasmaPackages = if hyprlandEnabled then [ pkgs.kdePackages.xwaylandvideobridge ] else [ ];
in
{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = excludedPlasmaPackages;
}
