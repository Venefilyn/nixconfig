{
  description = "Nix Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "https://flakehub.com/f/nix-community/home-manager/0.1.tar.gz";
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

    };
  };
}
