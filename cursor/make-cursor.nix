{
  pname,
  version,
  archives,
}:

{
  lib,
  stdenv,
  fetchurl,
  appimageTools,
  code-cursor,
}:

let
  archive =
    assert lib.assertMsg (archives ? ${stdenv.hostPlatform.system})
      "${pname} is not available for ${stdenv.hostPlatform.system}";
    archives.${stdenv.hostPlatform.system};

  source = fetchurl { inherit (archive) url hash; };
in
code-cursor.overrideAttrs (old: {
  inherit pname version;

  src =
    if stdenv.hostPlatform.isLinux then
      appimageTools.extract {
        inherit pname version;
        src = source;
      }
    else
      source;

  # Linux extracts the AppImage to usr/share/cursor. The macOS zip unpacks to Cursor.app.
  sourceRoot =
    if stdenv.hostPlatform.isLinux then
      "${pname}-${version}-extracted/usr/share/cursor"
    else
      "Cursor.app";

  meta = old.meta // {
    platforms = builtins.attrNames archives;
  };
})
