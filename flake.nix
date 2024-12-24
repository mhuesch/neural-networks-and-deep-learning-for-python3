{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        devShells = {
          default =
            let pkgs = import nixpkgs { inherit system; };
            in
            pkgs.mkShell {
              buildInputs = with pkgs; [
                (python311.withPackages(ps: []))
                python311Packages.pip
              ];
            };
        };
      });
}
