
{ pkgs, ... }: let
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
in {
  services.displayManager.sddm.theme = "sddm-astronaut-theme";

  environment.systemPackages = [
    sddm-astronaut
  ];
}
