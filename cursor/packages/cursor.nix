rec {
  pname = "cursor";
  version = "3.31.11";
  commit = "52fdf018932f1335bc6dd36acc5e33d30759192e";

  archives = {
    aarch64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/arm64/Cursor-${version}-aarch64.AppImage";
      hash = "sha256-Ik+w2H75Em/Uzi5TT0I52hek9McsOcQocXh+PNQ1hmQ=";
    };
    x86_64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/x64/Cursor-${version}-x86_64.AppImage";
      hash = "sha256-PVRZQnG4dH7su7J7J9PdiAtrRxPRBqNYrxH2ev9Zs/I=";
    };
    aarch64-darwin = {
      url = "https://downloads.cursor.com/production/${commit}/darwin/arm64/Cursor-darwin-arm64.zip";
      hash = "sha256-vasheexsbc064HqWiRp9J1GXhE4J2/9/iVuQsmobhf4=";
    };
  };
}
