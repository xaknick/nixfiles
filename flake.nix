{
  description = "My Nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs =
    { nixpkgs, ... } @ inputs :
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos

            ./desktop/kde.nix
            
            ./programs/common.nix
            ./programs/terminal.nix
	    ./programs/nvim.nix
            ./programs/terminal-tools.nix
            ./programs/fonts.nix

            ./programs/develop.nix
            # ./programs/ide.nix
            ./programs/ide.nix
          ];
        };
      };
    };
}
