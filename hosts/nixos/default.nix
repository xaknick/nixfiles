{ ... }:
{
  imports = [
    ./bootloader.nix
    ./network.nix
    ./time-and-culture.nix
    ./xserver.nix
    ./users.nix
    ./hardware.nix

    ./nix-configuration.nix

    ./hardware-configuration.nix # Auto-generated
  ];
}
