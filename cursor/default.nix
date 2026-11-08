{ callPackage, code-cursor }:

let
  release = import ./packages/cursor.nix;
in
{
  code-cursor = callPackage ((import ./make-cursor.nix) {
    inherit (release) pname version archives;
    upstream = code-cursor;
  }) { };
}
