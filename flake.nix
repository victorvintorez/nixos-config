{
  description = "Victor's NixOS Config";

  # Cachix
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
    ];

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # agenix
    #agenix = {
    #  url = "github:ryantm/agenix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    # Nix-hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Nix-colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    
    # Hyprland XDG Desktop Portal
    xdg-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
    };

    # Nixvim
    nixvim = {
	url = "github:nix-community/nixvim";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    # Schizofox
    schizofox.url = "github:schizofox/schizofox";
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
        # Desktop
        desktop = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/desktop
          ];
        };

        # TODO - Laptop
        laptop = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/laptop
          ];
        };
      };
    };
}
