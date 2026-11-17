{
  pname,
  version,
  archives,
  upstream,
}:

{
  lib,
  stdenv,
  fetchurl,
  appimageTools,
}:

let
  archive =
    assert lib.assertMsg (archives ? ${stdenv.hostPlatform.system})
      "${pname} is not available for ${stdenv.hostPlatform.system}";
    archives.${stdenv.hostPlatform.system};

  source = fetchurl { inherit (archive) url hash; };
in
upstream.overrideAttrs (old: {
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

  # Redirect nixpkgs' ripgrep patch to Cursor's platform-specific binary.
  postPatch =
    if stdenv.hostPlatform.isLinux then
      let
        legacyPath = "resources/app/node_modules/@vscode/ripgrep/bin/rg";
        ripgrepPlatform = {
          x86_64-linux = "linux-x64";
          aarch64-linux = "linux-arm64";
        }.${stdenv.hostPlatform.system};
        ripgrepPath = "resources/app/node_modules/@cursor/ripgrep-${ripgrepPlatform}/bin/rg";
        upstreamPostPatch = old.postPatch or "";
      in
      assert lib.assertMsg (lib.hasInfix legacyPath upstreamPostPatch)
        "${pname}: upstream ripgrep patch changed; review the compatibility override";
      lib.replaceStrings [ legacyPath ] [ ripgrepPath ] upstreamPostPatch
    else
      old.postPatch or "";
})
