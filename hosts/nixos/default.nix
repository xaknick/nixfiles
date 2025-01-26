{ ... }:
{
  imports = [
    ./bootloader.nix
    ./network.nix
    ./time-and-culture.nix
    ./xserver.nix
    ./sddm.nix
    ./sddm-theme.nix
    ./users.nix
    ./hardware.nix
    ./yubikey.nix

    ./nix-configuration.nix

    ./hardware-configuration.nix # Auto-generated
  ];
}
