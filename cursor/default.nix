{ callPackage }:

let
  release = import ./packages/cursor.nix;
in
{
  cursor = callPackage ((import ./make-cursor.nix) {
    inherit (release) pname version archives;
  }) { };
}
