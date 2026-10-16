{
  description = "Waybar configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      preview = import ./preview.nix { inherit pkgs; };
    in
    {
      packages.${system} = {
        default = preview.nested;
        native = preview.native;
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = [ pkgs.waybar ];
      };

      homeManagerModules.default = import ./default.nix;
    };
}
