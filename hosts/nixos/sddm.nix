{ pkgs, lib, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm; # qt6 sddm version
    extraPackages = [
      pkgs.kdePackages.qt5compat
      pkgs.kdePackages.qtsvg
    ];
  };
}
