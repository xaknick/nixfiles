{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.rider
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-7.0.410"
  ];
}
