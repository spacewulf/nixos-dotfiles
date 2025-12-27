{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, sops-nix, ... }@inputs: {
    nixosConfigurations.keesNix = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        stylix.nixosModules.stylix
        ./configuration.nix
        home-manager.nixosModules.home-manager
        sops-nix.nixosModules.sops
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kees = import ./home.nix;
            backupFileExtension = "backup";
            extraSpecialArgs = {
              inherit inputs;
            }; 
          };
        }
      ];
    };
  };
}
