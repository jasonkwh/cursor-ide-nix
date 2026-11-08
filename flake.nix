{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
    in
    {
      packages = forAllSystems (system: {
        inherit ((pkgsFor system).callPackage ./cursor { }) code-cursor;
      });
      nixosModules.default = {
        imports = [ ./module.nix ];
        nixpkgs.overlays = [
          (final: prev: {
            inherit (prev.callPackage ./cursor { code-cursor = prev.code-cursor; }) code-cursor;
          })
        ];
      };
    };
}
