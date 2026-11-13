rec {
  pname = "cursor";
  version = "3.30.8";
  commit = "4a44c846d0b817fab060823f93c63ea2861ac192";

  archives = {
    aarch64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/arm64/Cursor-${version}-aarch64.AppImage";
      hash = "sha256-lM5CB2S1rRT4DxK+O3ACQdLoXhRx965N90Bb02OshZY=";
    };
    x86_64-linux = {
      url = "https://downloads.cursor.com/production/${commit}/linux/x64/Cursor-${version}-x86_64.AppImage";
      hash = "sha256-7Ar3giXoppvCrfzyM3xyjROnJOFENixgoW0lljfWfHg=";
    };
    aarch64-darwin = {
      url = "https://downloads.cursor.com/production/${commit}/darwin/arm64/Cursor-darwin-arm64.zip";
      hash = "sha256-BA2SfV6BgGT7ynrAaQMhmee1ljw40vvYDc+hlhSOhqM=";
    };
  };
}
