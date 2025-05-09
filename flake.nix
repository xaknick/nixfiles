{
  description = "My Nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wezterm.url = "github:wez/wezterm?dir=nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      hyprlandEnabled = false; # Set to false to disable Hyprland
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs hyprlandEnabled;
          };
          system = "x86_64-linux";
          modules =
            [
              ./hosts/nixos
              ./desktop/kde.nix
            ]
            ++ (if hyprlandEnabled then [ ./desktop/hyprland.nix ] else [ ])
            ++ [
              ./programs/common.nix
              ./programs/terminal.nix
              ./programs/nvim.nix
              ./programs/terminal-tools.nix
              ./programs/fonts.nix
              ./programs/develop.nix
              # ./programs/ide.nix
              # ./programs/work.nix
            ];
        };
      };
    };
}
