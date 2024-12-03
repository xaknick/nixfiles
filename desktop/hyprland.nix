{ pkgs, lib, ... }:
{
  # Enable Hyprland
  services.displayManager.defaultSession = "hyprland";
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  environment.systemPackages = with pkgs; [
    hyprcursor
    hyprlock
    hypridle
    hyprpaper

    # Required services or libraries
    qt6.qtwayland
    qt5.qtwayland
    poweralertd
    wl-clipboard
    waybar
    fish # for waybar scripts
    rofi-wayland
    dunst
    avizo
    wlogout
    libnotify
    nwg-look
    dolphin

    # Network
    iwgtk
    impala
  ];

  # Services
  services.upower.enable = true;
  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      xfce.xfconf
      gnome2.GConf
    ];
  };
  services.mpd.enable = true;

  # Network
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General = {
        EnableNetworkConfiguration = true;
      };
    };
  };

  # Force disabling Network Manager
  networking.networkmanager.enable = lib.mkForce false;
}
