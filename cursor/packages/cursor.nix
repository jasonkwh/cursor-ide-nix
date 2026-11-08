rec {
  pname = "cursor";
  version = "3.29.9";
  commit = "306d153d51d714882ab7b1bc49649cab624e8a31";

  archives = {
    aarch64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/arm64/Cursor-${version}-aarch64.AppImage";
      hash = "sha256-McHdW0g75MEL9LOgHozbvGEGA3nHUghGKAZuSzgmmlI=";
    };
    x86_64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/x64/Cursor-${version}-x86_64.AppImage";
      hash = "sha256-xDtVthf031Xgmgv9fj54IJxuwQuCFcgupePxn11MppM=";
    };
    aarch64-darwin = {
      url = "https://downloads.cursor.com/production/${commit}/darwin/arm64/Cursor-darwin-arm64.zip";
      hash = "sha256-epIT1J98UGQZRG/n9z/WRa9BrQMVdHTkavQAU0pE/CM=";
    };
  };
}
