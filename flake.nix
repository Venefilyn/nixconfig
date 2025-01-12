{
  description = "Nix Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Overlays


  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    # Available through 'home-manager --flake .#your-username@your-hostname'

    homeConfigurations = {

      "spytec@sabre" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [
          ./home.nix
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./sabre/spytec.nix
          ./sabre/custom.nix
          # self-manage
          {
            home.packages = [
            ];
          }
          ({
           nixpkgs.overlays = [];
          })

        ];
      };

      "spytec@frieren" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [
          ./home.nix
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./frieren/spytec.nix
          ./frieren/custom.nix
          # self-manage
          {
            home.packages = [
            ];
          }
          ({
           nixpkgs.overlays = [];
          })

        ];
      };
    };
  };
}
