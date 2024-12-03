{ pkgs, lib, ... }: let
  # https://github.com/Keyitdev/sddm-astronaut-theme
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      AccentColor = "#746385";
      # FormPosition = "left";
      PartialBlur = "false";
      FullBlur = "true";
      BlurMax = "64";
      Blur = "1.0";

      ForceHideCompletePassword = true;
    };
  };
in {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    package = lib.mkForce pkgs.kdePackages.sddm; # qt6 sddm version
    extraPackages = [ pkgs.sddm-astronaut ];
  };

  environment.systemPackages = [
    sddm-astronaut
  ];
}
