{
  description = "vladucu's nix-based system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    darwin = {
      url = "github:lnl7/nix-darwin/8be7f197120739b3ec15f994bdc48116726c6159";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, nixpkgs }@inputs:
  {
    darwinConfigurations."vladucu" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      inherit inputs;
      modules = [
        ./configuration.nix
        # Needed to work around bug until https://github.com/LnL7/nix-darwin/pull/552 is merged
        { documentation.enable = false; }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."vladucu".pkgs;
  };
}