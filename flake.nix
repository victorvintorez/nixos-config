{
  description = "Victor's NixOS Config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

    # Nix-hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Nix-colors
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      inherit lib;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # Test system (virtual machine)
        test = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/test
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPackages = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs outputs; };
              home-manager.users = {
                victorvintorez = import ./home/victorvintorez/test;
              };
            };
          ];
        };

        # Desktop
        desktop = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/desktop
            {
              home-manager.useGlobalPackages = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs outputs; };
              home-manager.users = {
                victorvintorez = import ./home/victorvintorez/desktop;
              };
            };
          ];
        };

        # TODO - Laptop
      };
    };
}
