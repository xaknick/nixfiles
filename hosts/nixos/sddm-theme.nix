{ pkgs, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      FormPosition = "left";
      PartialBlur = "true";
      FullBlur = "false";
      BlurMax = "64";
      Blur = "1.0";

      ForceHideCompletePassword = true;
    };
  };
  tokyo-night-sddm = pkgs.callPackage ./sddm-tokyo-night.nix { };
in
{
  # services.displayManager.sddm.theme = "sddm-astronaut-theme";
  services.displayManager.sddm.theme = "tokyo-night-sddm-qt6";

  environment.systemPackages = [
    sddm-astronaut
    tokyo-night-sddm
  ];
}
